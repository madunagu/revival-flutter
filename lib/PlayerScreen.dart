import 'dart:developer';

import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/blocs/player.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/events/PlayerEvent.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/BottomSheetLine.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:devotion/widgets/PlayerTabsWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class PlayerScreen extends StatefulWidget {
  final VideoPost playable;

  final List<double> ratios = [1.77, 3.5];
  PlayerScreen({this.playable});
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with TickerProviderStateMixin {
  double videoScreenRatio;

  Size size;

  TabController _tabController;
  VideoPlayerController _videoController;

  Future<void> _initializeVideoPlayerFuture;

  toggleSheet(DragEndDetails e) {
    log(e.velocity.pixelsPerSecond.dy.toString());
    if (e.velocity.pixelsPerSecond.dy > 330) {
      setState(() {
        log(videoScreenRatio.toString());
        videoScreenRatio = widget.ratios[0];
      });
    } else {
      setState(() {
        videoScreenRatio = widget.ratios[1];
      });
    }
  }

  double getHeight() {
    return size.width / videoScreenRatio;
  }

  @override
  void initState() {
    videoScreenRatio = widget.ratios[0];
    _videoController =
        VideoPlayerController.network(rootURL + widget.playable.srcUrl);
    _initializeVideoPlayerFuture = _videoController.initialize().then((_) {
      log('VIDEO LOADED FROM NET');
      _videoController.play();
      setState(() {
        videoScreenRatio = _videoController.value.aspectRatio;
//          sheetPositionTop = size.width / videoScreenRatio + 36;
      });
    }, onError: (_) {
      log('error initializing video');
    });

    _videoController.setLooping(true);

    _tabController = TabController(vsync: this, length: 4);
    BlocProvider.of<PlayerBloc>(context)
        .add(PlayerFetched(id: 1, playedType: PlayedType.video));
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return AppScaffoldWidget(
      paddingTop: 0,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            VideoWidget(
              size: size,
              controller: _videoController,
              initFunction: _initializeVideoPlayerFuture,
            ),
            VideoControls(
              size: size,
              height: getHeight() + 16,
              controller: _videoController,
            ),
            Positioned(
              top: getHeight() - 6,
              child: VideoSlider(
                controller: _videoController,
                size: size,
              ),
            ),
            Positioned(
              top: getHeight() + 30,
              height: size.height - getHeight(),
              child: Container(
                padding: EdgeInsets.only(top: 12),
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onVerticalDragEnd: toggleSheet,
                      child: SheetHeaderWidget(
                        size: size,
                        titles: titles,
                        tabController: _tabController,
                      ),
                    ),
                    Container(
                      height: size.height - getHeight() - 108,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: VideoDetailsWidget(
                              playable: widget.playable,
                              playedType: PlayedType.video,
                            ),
                          ),
                          SingleChildScrollView(
                            child: LyricsWidget(),
                          ),
                          BlocProvider(
                            create: (BuildContext context) => ListBloc(
                                feedType: 'comment', resource: '/comments')
                              ..add(ListFetched()),
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

class SheetHeaderWidget extends StatefulWidget {
  const SheetHeaderWidget({
    Key key,
    @required this.size,
    @required this.tabController,
    @required this.titles,
  }) : super(key: key);

  final TabController tabController;
  final Size size;
  final List<String> titles;

  @override
  _SheetHeaderWidgetState createState() => _SheetHeaderWidgetState();
}

class _SheetHeaderWidgetState extends State<SheetHeaderWidget> {
  int activeSlide = 0;
  @override
  void initState() {
    widget.tabController.addListener(() {
      int i = widget.tabController.index;
      setState(() {
        activeSlide = i;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      color: Colors.transparent,
      height: 66,
      child: Column(
        children: [
          SizedBox(height: 12),
          BottomSheetLine(),
          SizedBox(height: 20),
          Container(
            width: widget.size.width,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.titles[activeSlide],
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DottedTabBarWidget(
                  count: 4,
                  active: activeSlide,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VideoControls extends StatefulWidget {
  VideoControls({
    this.size,
    this.height,
    this.controller,
  });

  final VideoPlayerController controller;
  final Size size;
  final double height;
  @override
  _VideoControlsState createState() => _VideoControlsState();
}

class _VideoControlsState extends State<VideoControls> {
  bool isControlsVisible = false;

  showControls() {
    setState(() {
      isControlsVisible = true;
    });
  }

  hideControls() {
    setState(() {
      isControlsVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    log('video controls built again');
    return Positioned(
      top: 0,
      width: widget.size.width,
      child: GestureDetector(
        onTap: showControls,
        child: Container(
          width: widget.size.width,
          height: widget.height,
          color: Colors.transparent,
          child: isControlsVisible
              ? GestureDetector(
                  onTap: hideControls,
                  child: Container(
                    height: widget.height,
                    width: widget.size.width,
                    color: Colors.transparent,
                    padding: const EdgeInsets.only(top: 56),
                    child: Column(
                      children: [
                        Container(
                          width: widget.size.width,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.filter,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        widget.controller.value.initialized
                            ? Container(
                                width: widget.size.width,
                                height: widget.height - 80,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.skip_previous,
                                      color: Colors.white,
                                      size: 34,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (widget
                                              .controller.value.isPlaying) {
                                            widget.controller.pause();
                                          } else {
                                            widget.controller.play();
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xffd47fa6),
                                        ),
                                        child: widget.controller.value.isPlaying
                                            ? Icon(
                                                Icons.pause,
                                                color: Colors.white,
                                                size: 34,
                                              )
                                            : Icon(
                                                Icons.play_arrow,
                                                color: Colors.white,
                                                size: 34,
                                              ),
                                      ),
                                    ),
                                    Icon(Icons.skip_next,
                                        color: Colors.white, size: 34),
                                  ],
                                ),
                              )
                            : Container(
                                height: widget.height - 80,
                                width: widget.size.width,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: widget.size.width,
                  height: widget.height,
                ),
        ),
      ),
    );
  }
}

class VideoSlider extends StatefulWidget {
  const VideoSlider({
    Key key,
    @required this.controller,
    @required this.size,
  }) : super(key: key);

  final VideoPlayerController controller;
  final Size size;

  @override
  _VideoSliderState createState() => _VideoSliderState();
}

class _VideoSliderState extends State<VideoSlider> {
  double sliderPos = 0;
  void sliderChanged(val) {
    setState(() {
      sliderPos = val;
    });
    widget.controller.seekTo(
      Duration(
        seconds: val.round(),
      ),
    );
  }

  @override
  void initState() {
    sliderPos = widget.controller.value.position != null
        ? widget.controller.value.position.inSeconds.toDouble()
        : 0;
    widget.controller.addListener(() {
      setState(() {
        sliderPos = widget.controller.value.position.inSeconds.toDouble();
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.size.width,
        child: Slider(
          value: sliderPos,
          max: widget.controller.value.duration != null
              ? widget.controller.value.duration.inSeconds * 1.0
              : 1,
          onChanged: sliderChanged,
          inactiveColor: Color(0x50d47fa6),
          activeColor: Color(0xdfffffff),
        ));
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
  final VideoPlayerController controller;
  final Future<void> initFunction;
  final Size size;
  VideoWidget({
    @required this.controller,
    @required this.initFunction,
    this.size,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.topCenter,
      color: Colors.black,
      child: FutureBuilder(
        future: initFunction,
        builder: (context, snapshot) {
          log('built video again');
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: size.width,
              height: size.width / controller.value.aspectRatio + 60,
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
