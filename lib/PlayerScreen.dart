import 'dart:developer';

import 'package:devotion/blocs/player.bloc.dart';
import 'package:devotion/events/PlayerEvent.dart';
import 'package:devotion/states/PlayerState.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/BottomSheetLine.dart';
import 'package:devotion/widgets/CommentItemWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/InteractionButtonWidget.dart';
import 'package:devotion/widgets/MessageItemWidget.dart';
import 'package:devotion/widgets/SmallItemWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerScreen extends StatelessWidget {
  final int id;
  final bool isVideo;
  PlayerScreen(this.id, {this.isVideo = true});
//   @override
//   _PlayerScreenState createState() => _PlayerScreenState();
// }

// class _PlayerScreenState extends State<PlayerScreen> {
  // double screenHeight = 340;
  // double playedRatio = 0.4;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<PlayerBloc>(context)
        .add(PlayerFetched(id: 1, playedType: PlayedType.video));

    return AppScaffoldWidget(
      paddingTop: 0,
      body: Container(
        width: size.width,
        height: size.height,
        child: BlocConsumer<PlayerBloc, PlayerState>(
          listener: (context, state) {
            // do stuff here based on BlocA's state
          },
          buildWhen: (previous, current) {
            return true;
            // to rebuild the widget with state
          },
          builder: (context, state) {
            return Stack(
              children: [
                CurrentlyPlaying(size: size),
                PlayerSheet(size: size, screenHeight: 340),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CurrentlyPlaying extends StatelessWidget {
  const CurrentlyPlaying({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            BlocProvider.of<PlayerBloc>(context).add(PlayerTouched());
          },
          child: Image.asset(
            'images/photo.png',
            width: size.width,
            height: 430,
            fit: BoxFit.cover,
          ),
        ),
        BlocBuilder<PlayerBloc, PlayerState>(
          builder: (context, state) {
            if (state is PlayerAttentive) {
              return Positioned(
                top: 0,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 56),
                  child: PlayerControls(size: size),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}

class VideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class PlayerSheet extends StatelessWidget {
  const PlayerSheet({
    Key key,
    @required this.size,
    @required this.screenHeight,
  }) : super(key: key);

  final Size size;
  final double screenHeight;

  toggleSheet(DragEndDetails e) {
    log(e.velocity.pixelsPerSecond.dy.toString());
    // if (e.velocity.pixelsPerSecond.dy > 330) {
    //   setState(() {
    //     screenHeight = 340;
    //   });
    // } else {
    //   setState(() {
    //     screenHeight = 130;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
                    DottedTabBarWidget(count: 5, active: 1),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height - screenHeight - 78,
              child: SingleChildScrollView(
                child: CommentsSectionWidget(),
              ),
            ),
          ],
        ),
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
  const VideoDetailsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alexio Morales',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: Colors.white,
          ),
        ),
        SizedBox(height: 3),
        Text(
          '128k views',
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VideoInteraction(active: true),
              VideoInteraction(
                icon: Icons.chat_bubble_outline,
              ),
              VideoInteraction(),
            ],
          ),
        ),
        Text(
          'A brief description of the video',
        ),
        ImageAvatarWidget(
          imageURL: 'images/avatar2.jpg',
          size: 48,
          borderColor: Colors.transparent,
        ),
        Text(
          'Channel Nae',
        )
      ],
    );
  }
}

class CommentsSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Comments'),
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

class VideoInteraction extends StatelessWidget {
  final String counter;
  final IconData icon;
  final bool active;
  const VideoInteraction({
    Key key,
    this.counter = '123k Likes',
    this.icon = Icons.favorite_border,
    this.active = false,
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
    return Container();
  }
}
