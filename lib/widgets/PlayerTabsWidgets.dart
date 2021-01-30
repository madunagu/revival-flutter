import 'dart:convert';

import 'package:devotion/bloc/blocs/player.bloc.dart';
import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/events/PlayerEvent.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/states/ListState.dart';
import 'package:devotion/models/Comment.dart';
import 'package:devotion/models/VideoPost.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/CommentItemWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/SmallItemWidget.dart';
import 'package:devotion/widgets/UserInfoWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final titles = ['Details', 'Lyrics', 'Comments', 'Related'];

class VideoDetailsWidget extends StatefulWidget {
  final dynamic playable;
  final PlayedType playedType;
  const VideoDetailsWidget(
      {Key key, @required this.playable, @required this.playedType})
      : super(key: key);

  @override
  _VideoDetailsWidgetState createState() => _VideoDetailsWidgetState();
}

class _VideoDetailsWidgetState extends State<VideoDetailsWidget> {
  dynamic playable;
  likeVideo() async {
    setState({
      this.playable.liked = 1;
    });
    String url = widget.playedType == PlayedType.video
        ? '/video-posts/'
        : '/audio-posts/';
    try {
      Map<ResponseKey, dynamic> liked =
          await NetworkingClass().post(url + playable.id.toString(), []);
      if (liked[ResponseKey.type] == ResponseType.data) {
        var res = liked[ResponseKey.data]['data'];
        if (res == true) {
     //already set to true
        } else {
          //handle liking error
               setState(() {
            this.playable.liked = 0;
          });
        }
      }
    } catch (_) {}
  }

  @override
  initState() {
    playable = widget.playable;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playable.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '${playable.viewsCount} views',
                ),
              ],
            ),
          ),
          CurvedCornerWidget(
            borderColor: Color(0xffE7E4E9),
            radius: 60,
            child: Container(
              padding:
                  EdgeInsets.only(top: 10, bottom: 30, right: 24, left: 24),
//              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VideoInteraction(
                    active: playable.liked == 1,
                    counter: '${playable.likesCount} likes',
                    onTap: likeVideo,
                  ),
                  VideoInteraction(
                    icon: Icons.chat_bubble_outline,
                    counter: '${widget.playable.commentsCount} comments',
                  ),
                  VideoInteraction(
                    counter: '',
                    icon: Icons.share,
                  ),
                ],
              ),
            ),
          ),
          CurvedCornerWidget(
            radius: 60,
            borderColor: Color(0xffE7E4E9),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: UserInfoWidget(user: widget.playable.user),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${widget.playable.createdAt.day.toString()} ${months[widget.playable.createdAt.month - 1]},  ${widget.playable.createdAt.year}",
                  style: TextStyle(
                    color: Color(0xff817889),
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),
                Text(
                  widget.playable.description,
                  style: TextStyle(color: Color(0xff817889)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CommentsSectionWidget extends StatefulWidget {
  @override
  _CommentsSectionWidgetState createState() => _CommentsSectionWidgetState();
}

class _CommentsSectionWidgetState extends State<CommentsSectionWidget> {
  List<CommentItemWidget> comments = [];
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
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
    return BlocBuilder<ListBloc, ListState>(
      builder: (BuildContext context, ListState state) {
        if (state is ListSuccess) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: state.models
                  .map((e) => CommentItemWidget(comment: e))
                  .toList(),
            ),
          );
        } else if (state is ListInitial) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Center(child: Text('No Comments'));
        }
      },
    );
  }
}

class CreateCommentWidget extends StatelessWidget {
  CreateCommentWidget({
    Key key,
    this.image,
  }) : super(key: key);
  final Image image;
  final double radius = 60;

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      // padding: EdgeInsets.only(top: this.radius),
      radius: this.radius,
      borderColor: Color(0xffE7E4E9),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 18, top: 30, right: 12, bottom: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageAvatarWidget(
              imageURL: 'images/avatar1.jpg',
              borderWidth: 2,
              borderColor: Color(0xff8A56AC),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 1.42,
                      letterSpacing: -0.14,
                    ),
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Comment here...',
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffE7E4E9)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 69,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Color(0xff8A56AC),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.send,
                      size: 16,
                      color: Colors.white,
                    ),
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

class VideoInteraction extends StatelessWidget {
  final String counter;
  final IconData icon;
  final bool active;
  final Function onTap;
  const VideoInteraction({
    Key key,
    this.counter = '123k Likes',
    this.icon = Icons.favorite_border,
    this.active = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: active ? Color(0xffd47fa6) : Colors.black,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              counter,
            ),
          ],
        ),
      ),
    );
  }
}

class MusicListWidget extends StatelessWidget {
  const MusicListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          isActive: true,
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
        SmallItemWidget(
          image: 'images/avatar1.jpg',
          title: 'I surrender',
          subTitle: 'Hillsong United',
          amount: '4:30',
        ),
      ],
    );
  }
}

TextStyle normalStyle = TextStyle(
    fontSize: 24,
    color: Color(0xff817889),
    fontWeight: FontWeight.bold,
    height: 1.2,
    wordSpacing: 2);
TextStyle highlightedStyle =
    normalStyle.copyWith(color: Color(0xffd47fa6), fontSize: 26);

class LyricsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Text(
            'This is all I have, that the love I have for you',
            style: normalStyle,
          ),
          SizedBox(height: 20),
          Text(
            'Doesn\'t fade along with you',
            style: normalStyle,
          ),
          SizedBox(height: 20),
          Text('The reason that I ask, I\'ve seen far too ',
              style: normalStyle),
          SizedBox(height: 20),
          Text('many friends walkaway and not come back',
              style: highlightedStyle),
          SizedBox(height: 20),
          Text('I would wash away, like branches on leaves,',
              style: normalStyle),
          SizedBox(height: 20),
          Text('Ill rather be kindling in your love', style: normalStyle),
          SizedBox(height: 20),
          Text(
              'So set me on fire like i\'ve never known, I wanna love you more',
              style: normalStyle),
        ],
      ),
    );
  }
}

class LyricLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text('Ill rather be kindling in your love', style: normalStyle),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
