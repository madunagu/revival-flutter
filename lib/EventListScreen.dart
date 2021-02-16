import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/blocs/post.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/bloc/states/ListState.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/Feed.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/CurvedEventItemWidget.dart';
import 'package:devotion/widgets/CurvedListItem.dart';
import 'package:devotion/widgets/CurvedMusicItemWidget.dart';
import 'package:devotion/widgets/CurvedVideoItemWidget.dart';
import 'package:devotion/widgets/CurvedPostItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/states/index.dart';

class EventListScreen extends StatelessWidget {
  final List<Color> colors;
  final tag;
  EventListScreen({Key key, this.colors, this.tag = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        color: Colors.white,
        title: 'Events',
        rightIcon: Icons.filter,
      ),
      body: BlocProvider(
        create: (BuildContext context) => ListBloc(
          feedType: 'event',
          resource: '/events',
        )..add(ListFetched()),
        child: EventList(
          colors: colors,
          tag: tag,
        ),
      ),
    );
  }
}

class EventList extends StatefulWidget {
  final List<Color> colors;
  final tag;
  EventList({Key key, this.colors, this.tag = 0}) : super(key: key);

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List<dynamic> items = [];

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ListBloc _listBloc;

  Widget organiseStack(List<dynamic> items, BuildContext context) {
    List<Widget> output = [];
    for (var i = 0; i < items.length; i++) {
      output.insert(
        0,
        Positioned(
          top: 195.0 * i,
          child: Hero(
            tag: 'mainTitle' + i.toString(),
            child: this.getEventWidget(items[i], trendingColors[i % 3]),
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

  Widget getEventWidget(Event item, color) {
    return CurvedEventItemWidget.fromEvent(item, color);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _listBloc = BlocProvider.of<ListBloc>(context);
//    _postBloc.add(PostFetched());
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
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ListBloc, ListState>(
      builder: (context, state) {
        if (state is ListInitial) {
          return Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        }
        if (state is ListFailure) {
          return Container(
            width: size.width,
            height: size.height,
            child: Text('failed to fetch posts'),
          );
        }
        if (state is ListSuccess) {
          if (state.models.isEmpty) {
            return Container(
              width: size.width,
              height: size.height,
              child: Text('no posts'),
            );
          }
          return this.organiseStack(state.models, context);
        }
        return Container();
      },
    );
  }
}
