import 'dart:developer';

import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/states/ListState.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/audio_post.dart';

class MusicListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Music',
        // subTitle: 'Find your people and do your thing',
        // imageURL: 'images/avatar1.jpg',
      ),
      paddingTop: 207,
      bodyColor: Color(0xff241332),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalCardGroup(
            title: 'Trending',
            res: '/audio-posts?',
          ),
          HorizontalCardGroup(
            title: 'Recent',
            res: '/audio-posts?',
          ),
          //--- doesn't have to be
          HorizontalCardGroup(
            title: 'Ministers',
            res: '/audio-posts?',
          ),
          HorizontalCardGroup(
            title: 'Tags',
            res: '/audio-posts?',
          ),
          // ----
          HorizontalCardGroup(
            title: 'Recently Played',
            res: '/audio-posts?',
          ),
        ],
      ),
    );
  }
}

class HorizontalCardGroup extends StatefulWidget {
  HorizontalCardGroup({required this.title, required this.res});
  final String title;
  final String res;
  @override
  _HorizontalCardGroupState createState() => _HorizontalCardGroupState();
}

class _HorizontalCardGroupState extends State<HorizontalCardGroup> {
  List<dynamic> items = [];

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  double width = 219;
  late final ListBloc _listBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _listBloc = BlocProvider.of<ListBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _listBloc.add(ListFetched());
      log('scroll: tried getting list again');
    }
  }

  Widget organiseStack(List<AudioPost> items, BuildContext context) {
    List<Widget> output = [];
    for (var i = 0; i < items.length; i++) {
      output.add(
        Positioned(
          width: this.width,
          child: HorizontalListItem(
            title: items[i].name,
            subTitle: items[i].author.name,
            image: items[i].images[0]?.medium != null
                ? items[i].images[0].medium
                : '',
          ),
          left: this.width * 169 / 219 * i,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(top: 16, left: 24),
        width: this.width * 169 / 219 * this.items.length + 70,
        height: 188,
        child: Stack(
          // overflow: Overflow.clip,

          children: output,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            if (state is ListInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ListFailure) {
              return Center(
                child: Text('failed to fetch posts'),
              );
            }
            if (state is ListSuccess) {
              if (state.models.isEmpty) {
                return Center(
                  child: Text('no posts'),
                );
              }
              return this.organiseStack(state.models, context);
            }
            return Container();
          },
        ),
        SizedBox(height: 51),
      ],
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;

  const HorizontalListItem({
    Key? key,
    required this.title,
    required this.subTitle,
    this.image = AVATAR_URL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(10),
        ),
        border: Border.all(color: Color(0xff241332), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38.5),
          bottomLeft: Radius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              width: 217,
              height: 110,
              fit: BoxFit.cover,
            ),
            Container(
              width: 217,
              height: 62,
              padding: EdgeInsets.only(left: 20, top: 14),
              color: Color(0xff352641),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 19 / 14,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        color: Colors.white, fontSize: 11, height: 15 / 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
