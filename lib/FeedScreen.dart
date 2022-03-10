import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/bloc/blocs/post.bloc.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/Feed.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/CurvedEventItemWidget.dart';
import 'package:devotion/widgets/CurvedListItem.dart';
import 'package:devotion/widgets/CurvedMusicItemWidget.dart';
import 'package:devotion/widgets/CurvedVideoItemWidget.dart';
import 'package:devotion/widgets/CurvedPostItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/states/index.dart';

class FeedScreen extends StatefulWidget {
  final List<Color> colors;
  final tag;
  FeedScreen({Key key, this.colors, this.tag = 0}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<dynamic> items = [];

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  Widget organiseStack(List<dynamic> items, BuildContext context) {
    List<Widget> output = [];
    for (var i = 0; i < items.length; i++) {
      output.insert(
        0,
        Positioned(
          top: 195.0 * i,
          child: Hero(
            tag: 'mainTitle' + i.toString(),
            child: this.switchFeedType(items[i], widget.colors[i % 3]),
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

  Widget switchFeedType(Feed item, color) {
    switch (item.parentableType) {
      case 'audio':
        return CurvedMusicItemWidget.fromAudio(item.parentable, color);
        break;
      case 'video':
        return CurvedVideoItemWidget.fromVideo(item.parentable);
        break;
      case 'event':
        return CurvedEventItemWidget.fromEvent(item.parentable, color);
        break;
      case 'post':
        return CurvedPostItemWidget.fromPost(item.parentable);
        break;
      default:
        return Container();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
    _postBloc.add(PostFetched());
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
            child: GestureDetector(
              onTap: () {
                _postBloc.add(PostFetched());
                setState(() {});
              },
              child: Icon(Icons.refresh),
            ),
          );
        }
        if (state is PostSuccess) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return this.organiseStack(state.posts, context);
        }
        return Container();
      },
    );
  }
}
