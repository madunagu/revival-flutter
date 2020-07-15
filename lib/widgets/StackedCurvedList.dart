import 'package:devotion/blocs/post.bloc.dart';
import 'package:devotion/events/PostEvent.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/states/PostState.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/CurvedListItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<CurvedListItem> items = [
  CurvedListItem(
    title: 'Practice French, English And Chinese',
    time: 'TUESDAY 5:30 PM',
    icon: Icons.public,
  ),
  CurvedListItem(
    title: 'Yoga and Meditation for Beginners',
    time: 'TODAY 5:30 PM',
    icon: Icons.flight_land,
  ),
  CurvedListItem(
    title: 'Practice French, English And Chinese',
    time: 'TUESDAY 5:30 PM',
    icon: Icons.hotel,
  ),
  CurvedListItem(
    title: 'Yoga and Meditation for Beginners',
    time: 'TODAY 5:30 PM',
    icon: Icons.flight_land,
  ),
];

class StackedCurvedList extends StatefulWidget {
  final List<Color> colors;
  StackedCurvedList({Key key, this.colors}) : super(key: key);

  @override
  _StackedCurvedListState createState() => _StackedCurvedListState();
}

class _StackedCurvedListState extends State<StackedCurvedList> {
  List<dynamic> items = [];

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;


  Widget organiseStack(List<dynamic> items) {
    List<Widget> output = [];
    for (var i = 0; i < items.length; i++) {
      output.insert(
        0,
        Positioned(
          top: 190.0 * i,
          child: Hero(
            tag: 'mainTitle' + i.toString(),
            child: CurvedCornerWidget(
              padding: EdgeInsets.only(top: 70),
              color: trendingColors[i % 4],
              child: CurvedListItem(
                title: items[i].name,
                time: items[i].startingAt.toString(),
              ),
            ),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        height: 190.0 * items.length + 200,
        child: Stack(
          children: output,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
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
      _postBloc.add(PostFetched());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is PostFailure) {
          return Center(
            child: Text('failed to fetch posts'),
          );
        }
        if (state is PostSuccess) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return this.organiseStack(state.posts);
        }
      },
    );
  }
}
