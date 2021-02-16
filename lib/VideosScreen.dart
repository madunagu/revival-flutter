import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/states/ListState.dart';
import 'package:devotion/models/VideoPost.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/widgets/InteractionButtonWidget.dart';
import 'package:devotion/widgets/UserInfoWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        color: Colors.white,
        title: 'Videos',
        rightIcon: Icons.filter,
      ),
      body: BlocProvider(
          create: (BuildContext context) => ListBloc(
                feedType: 'video',
                resource: '/video-posts',
              )..add(ListFetched()),
          child: VideosList()),
    );
  }
}

class VideosList extends StatefulWidget {
  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 700.0;
  ListBloc _listBloc;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ListBloc, ListState>(
      builder: (BuildContext context, ListState state) {
        if (state is ListSuccess) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: state.models
                  .map((e) => VideoItem(
                        video: e,
                        size: size,
                      ))
                  .toList(),
            ),
          );
        } else if (state is ListInitial) {
          return Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            child: Text('No Videos'),
          );
        }
      },
    );
  }
}

class VideoItem extends StatelessWidget {
  final VideoPost video;
  final Size size;
  const VideoItem({
    this.video,
    this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 72,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            width: size.width,
            child: UserInfoWidget(user: video.user),
          ),
          Container(
            width: size.width,
            height: 210,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    child: Container(
                      height: 210,
                      width: size.width - 24,
                      child: video.images != null
                          ? Image.network(
                              video.images[0].mediumUrl,
                              fit: BoxFit.cover,
                            )
                          : Container(),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: size.width - 24,
                  height: 105,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InteractionButtonWidget(
                          icon: Icons.favorite,
                          count: video.likesCount,
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        InteractionButtonWidget(
                          icon: Icons.comment,
                          count: video.commentsCount,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 210 / 2, //- 50 / 2,
                  left: (size.width / 2) - 12 - 50 / 2,
                  width: 50,
                  height: 50,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PlayerScreen(playable: this.video),
                      ),
                    ),
                    child: Icon(
                      Icons.play_circle_filled,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 50,
                  child: Container(
                    padding: EdgeInsets.only(left: 32, right: 56),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: video.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
