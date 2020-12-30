import 'dart:developer';

import 'package:devotion/blocs/player.bloc.dart';
import 'package:devotion/events/PlayerEvent.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/states/PlayerState.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/BottomSheetLine.dart';
import 'package:devotion/widgets/CommentItemWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/InteractionButtonWidget.dart';
import 'package:devotion/widgets/MessageItemWidget.dart';
import 'package:devotion/widgets/SmallItemWidget.dart';
import 'package:devotion/widgets/UserInfoWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerScreen extends StatefulWidget {
  final VideoPost playable;
  final bool isVideo;
  PlayerScreen({this.playable, this.isVideo = true});
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with TickerProviderStateMixin {
  double screenHeight = 340;
  double playedRatio = 0.4;
  TabController _tabController;
  bool isScreenControlsVisible = true;
  int activeSlide = 0;
  final titles = ['Details', 'Lyrics', 'Comments', 'Related'];
  toggleSheet(DragEndDetails e) {
    log(e.velocity.pixelsPerSecond.dy.toString());
    if (e.velocity.pixelsPerSecond.dy > 330) {
      setState(() {
        screenHeight = 340;
      });
//      screenHeight = 340;
//      BlocProvider.of<PlayerBloc>(context).add(PlayerDocked());
    } else {
      setState(() {
        screenHeight = 130;
      });
    }
  }

  showScreenControls() {
    setState(() {
      isScreenControlsVisible = true;
    });
  }

  hideScreenControls() {
    setState(() {
      isScreenControlsVisible = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(() {
      int i = _tabController.index;
      setState(() {
        activeSlide = i;
      });
    });
    BlocProvider.of<PlayerBloc>(context)
        .add(PlayerFetched(id: 1, playedType: PlayedType.video));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppScaffoldWidget(
      paddingTop: 0,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            InkWell(
              onTap: showScreenControls,
              child: VideoWidget(),
            ),
            Positioned(
              top: 0,
              child: isScreenControlsVisible
                  ? GestureDetector(
                      onTap: hideScreenControls,
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(top: 56),
                        child: PlayerControls(size: size),
                      ),
                    )
                  : Container(),
            ),
            Positioned(
              top: screenHeight,
              height: size.height - screenHeight,

              // width: size.width,
              child: Container(
                padding: EdgeInsets.only(top: 12),
                width: size.width,
                // height: size.height - screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onVerticalDragEnd: toggleSheet,
                      child: Container(
                        width: size.width,
                        color: Colors.transparent,
                        height: 66,
                        child: Column(
                          children: [
                            SizedBox(height: 12),
                            BottomSheetLine(),
                            SizedBox(height: 20),
                            Container(
                              width: size.width,
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    titles[activeSlide],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  DottedTabBarWidget(
                                      count: 4, active: activeSlide),
                                ],
                              ),
                            ),
//                    SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: size.height - screenHeight - 78,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: VideoDetailsWidget(
                              video: widget.playable,
                            ),
                          ),
                          SingleChildScrollView(
                            child: LyricsWidget(),
                          ),
                          SingleChildScrollView(
                            child: CommentsSectionWidget(),
                          ),
                          SingleChildScrollView(
                            child: MusicListWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DockedCurrentlyPlaying extends StatelessWidget {
  final Size size;
  DockedCurrentlyPlaying({
    this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/photo.png'),
              alignment: Alignment.center,
              fit: BoxFit.fill),
          color: Color(0x66ffffff)),
      padding: EdgeInsets.only(left: 24, right: 24, top: 36),
      child: Column(
        children: [
          SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'images/avatar2.jpg',
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Highs and Lows',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 19 / 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Hillsong United',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff998FA2),
                      height: 15 / 12,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "4:30",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 19 / 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'images/photo.png',
//      width: size.width,
        height: 430,
        fit: BoxFit.cover,
      ),
    );
  }
}

class PlayerControls extends StatelessWidget {
  const PlayerControls({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              Icon(
                Icons.filter,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: 60),
        Container(
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.skip_previous,
                color: Colors.white,
                size: 34,
              ),
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xffd47fa6),
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              Icon(Icons.skip_next, color: Colors.white, size: 34),
            ],
          ),
        ),
        SizedBox(height: 50),
        Container(
          width: size.width,
          child: Slider(
            value: .4,
            onChanged: (val) {
              // setState(() {
              //   playedRatio = val;
              // });
            },
            inactiveColor: Color(0x50d47fa6),
            activeColor: Color(0xdfffffff),
          ),
        )
      ],
    );
  }
}

class VideoDetailsWidget extends StatelessWidget {
  final VideoPost video;
  const VideoDetailsWidget({Key key, @required this.video}) : super(key: key);

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
                  video.name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '${video.viewsCount} views',
                ),
              ],
            ),
          ),
          CurvedCornerWidget(
            borderColor: Color(0xffE7E4E9),
            radius: 60,
            child: Container(
              padding: EdgeInsets.only(top: 10,bottom: 30, right: 24, left: 24),
//              margin: EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VideoInteraction(
                    active: video.liked == 1,
                    counter: '${video.likesCount} likes',
                    onTap: (){
                      BlocProvider.of<PlayerBloc>(context).add(PlayerLiked(id: video.id,playedType: PlayedType.video));
                    },
                  ),
                  VideoInteraction(
                    icon: Icons.chat_bubble_outline,
                    counter: '${video.commentsCount} comments',
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
            child: UserInfoWidget(user: video.user),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${video.createdAt.day.toString()} ${months[video.createdAt.month - 1]},  ${video.createdAt.year}",
                  style: TextStyle(
                    color: Color(0xff817889),
                    fontWeight: FontWeight.bold,
                    height: 2,
                  ),
                ),
                Text(
                  video.description,
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

class CommentsSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateCommentWidget(),
        CommentItemWidget(
          message:
              'Check out this meetup with an extrely long oent in order to hek how the iew is going to be displayed without inter ferene of the elastiity',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: 'Aug 19',
          name: 'Stephen Moreau',
        ),
        CommentItemWidget(
          message: 'Welcome to Kizomba meetup',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: 'Jun 21',
          name: 'Andy Lane',
        ),
        CommentItemWidget(
          message: 'Feb 13',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: '8hrs',
          name: 'Anson Buck',
        ),
        CommentItemWidget(
          message: 'Bonjour',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: 'Sep 18, 2017',
          name: 'Dinar Meyer',
        ),
      ],
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
                    minLines: 3,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Comment here...',
                      border: OutlineInputBorder(
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
    return Column(
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

class LyricsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle normalStyle = TextStyle(
        fontSize: 24,
        color: Color(0xff817889),
        fontWeight: FontWeight.bold,
        height: 1.2,
        wordSpacing: 2);
    TextStyle highlightedStyle =
        normalStyle.copyWith(color: Color(0xffd47fa6), fontSize: 26);
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
