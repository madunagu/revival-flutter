import 'dart:async';
import 'dart:developer';

import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/blocs/player.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/BottomSheetLine.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:devotion/widgets/PlayerTabsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_service/audio_service.dart';

import 'models/audio_post.dart';

//import 'package:just_audio/just_audio.dart';
//import 'package:devotion/util/AudioPlayerTask.dart';

class MusicPlayerScreen extends StatefulWidget {
  final AudioPost playable;
  MusicPlayerScreen({required this.playable});
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with TickerProviderStateMixin {
  double playedRatio = 0;

  double sheetPositionTop = 280;
  bool isDocked = false;
  int activeSlide = 0;

  late TabController _tabController;

  toggleSheet(DragEndDetails e) {
    log(e.velocity.pixelsPerSecond.dy.toString());
    if (e.velocity.pixelsPerSecond.dy > 330) {
      setState(() {
        sheetPositionTop = 280;
        isDocked = false;
      });
    } else {
      setState(() {
        sheetPositionTop = 130;
        isDocked = true;
      });
    }
  }

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: titles.length);

    BlocProvider.of<PlayerBloc>(context)
        .add(PlayerFetched(id: 1, playedType: PlayedType.video));

    playMusic();
    super.initState();
  }

  void playMusic() async {
    log('trying to play music');
    var item = MediaItem(
      id: ROOT_URL + widget.playable.srcUrl,
      album: 'Devotion Albums',
//      artist: audio.author.name,
      title: widget.playable.name,
    );
    // await AudioService.start(backgroundTaskEntrypoint: audioEntryPoint);
    await AudioService.customAction('playAudio', [
      widget.playable.name,
      widget.playable.author?.name,
      widget.playable.srcUrl,
    ]);
    await AudioService.addQueueItem(item);
    // await AudioService.play();
  }

  @override
  void dispose() {
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
            isDocked
                ? DockedCurrentlyPlaying(
                    size: size,
                    audio: widget.playable,
                  )
                : AudioWidget(
                    audio: widget.playable,
                    size: size,
                    height: sheetPositionTop,
                  ),
            AudioControls(
              size: size,
            ),
            Positioned(
              top: sheetPositionTop - 35,
              child: AudioSlider(
                size: size,
                audio: widget.playable,
              ),
            ),
            Positioned(
              top: sheetPositionTop,
              height: size.height - sheetPositionTop + 20,
              child: Container(
                padding: EdgeInsets.only(top: 12),
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
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
                      height: size.height - sheetPositionTop - 78,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          SingleChildScrollView(
                            child: VideoDetailsWidget(
                              playable: widget.playable,
                              playedType: PlayedType.audio,
                            ),
                          ),
                          SingleChildScrollView(
                            child: LyricsWidget(),
                          ),
                          BlocProvider(
                            create: (BuildContext context) => ListBloc(
                              feedType: 'comment',
                              resource: '/comments',
                            )..add(ListFetched()),
                            child: CommentsSectionWidget(),
                          ),
                          BlocProvider(
                            create: (BuildContext context) => ListBloc(
                              feedType: 'audio',
                              resource: "/audio-posts/${widget.playable.id}",
                              method: Method.PUT,
                            )..add(ListFetched()),
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
    Key? key,
    required this.size,
    required this.tabController,
    required this.titles,
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

class AudioControls extends StatefulWidget {
  AudioControls({
    required this.size,
  });
  final Size size;
  @override
  _AudioControlsState createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  bool isControlsVisible = true;
  double height = 280;
  bool isPlaying = false;
  bool isLoaded = true;
  bool isError = false;
  late final StreamSubscription<PlaybackState> audioStateSub;

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
  void initState() {
    initAudio();
    super.initState();
  }

  @override
  void dispose() {
    audioStateSub.cancel();
    super.dispose();
  }

  void initAudio() {
    audioStateSub =
        AudioService.playbackStateStream.listen((PlaybackState state) {
      log(state.processingState.toString());
      setState(() {
        if (state.playing) {
          isPlaying = true;
          isLoaded = true;
          log('AudioProcessingState.playing');
        } else {
          isPlaying = false;
          switch (state.processingState) {
            case AudioProcessingState.none:
            case AudioProcessingState.connecting:
              isLoaded = false;
              break;
            case AudioProcessingState.error:
              isError = true;
              isLoaded = false;
              break;
            case AudioProcessingState.buffering:
              isLoaded = false;
              break;
            case AudioProcessingState.ready:
              isLoaded = true;

              break;
            case AudioProcessingState.fastForwarding:
            case AudioProcessingState.rewinding:
            case AudioProcessingState.skippingToPrevious:
            case AudioProcessingState.skippingToNext:
            case AudioProcessingState.skippingToQueueItem:
            case AudioProcessingState.completed:
              isLoaded = true;
              break;
            case AudioProcessingState.stopped:
              isLoaded = true;
              break;
          }
        }
      });
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
          height: height,
          color: Colors.transparent,
          child: isControlsVisible
              ? GestureDetector(
                  onTap: hideControls,
                  child: Container(
                    height: height,
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
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
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
                        isLoaded
                            ? Container(
                                width: widget.size.width,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 50,
                                  vertical: 30 / 540 * height,
                                ),
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
                                        if (isPlaying) {
                                          AudioService.pause();
                                          isPlaying = false;
                                        } else {
                                          AudioService.play();
                                          isPlaying = true;
                                        }
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
                                        child: isPlaying
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
                                    Icon(
                                      Icons.skip_next,
                                      color: Colors.white,
                                      size: 34,
                                    ),
                                  ],
                                ),
                              )
                            : isError
                                ? Container(
                                    height: height - 86,
                                    width: widget.size.width,
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Color(0xffffffff),
                                      ),
                                      child: Icon(Icons.refresh,
                                          color: trendingColors[0], size: 45),
                                    ),
                                  )
                                : Container(
                                    height: height - 86,
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
                  height: height,
                ),
        ),
      ),
    );
  }
}

class AudioSlider extends StatefulWidget {
  const AudioSlider({
    Key? key,
    required this.audio,
    required this.size,
  }) : super(key: key);

  final Size size;
  final AudioPost audio;

  @override
  _AudioSliderState createState() => _AudioSliderState();
}

class _AudioSliderState extends State<AudioSlider> {
  double sliderPos = 0;
  double duration = 0;
  late final StreamSubscription<double> positionSub;
  void sliderChanged(val) async {
    setState(() {
      sliderPos = val;
    });

    await AudioService.seekTo(Duration(seconds: val.round()));
  }

  @override
  void initState() {
    positionSub = AudioService.positionStream
        .map((d) => d.inSeconds.toDouble())
        .distinct()
        .listen((double position) {
      setState(() {
        sliderPos = position;
      });
      log("position $position");
    });
    duration = widget.audio.length.toDouble();
    log(duration.toString());
    super.initState();
  }

  @override
  void dispose() {
    positionSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      child: Slider(
        value: sliderPos,
        max: duration,
        onChanged: sliderChanged,
        inactiveColor: Color(0x50d47fa6),
        activeColor: Color(0xdfffffff),
      ),
    );
  }
}

class DockedCurrentlyPlaying extends StatelessWidget {
  final Size size;
  final AudioPost audio;

  const DockedCurrentlyPlaying({
    required this.size,
    required this.audio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/photo.png'),
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
        color: Color(0x66ffffff),
      ),
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
                    audio.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      height: 19 / 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    audio.author.name,
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
                getAsMinutes(audio.length),
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

class AudioWidget extends StatelessWidget {
  final Size size;
  final double height;
  final AudioPost audio;
  const AudioWidget({required this.size, required this.height, required this.audio});
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(top:22),
      width: size.width,
      height: height + 30,
      child: audio.images != null
          ? Image.network(audio.images[0].medium, fit: BoxFit.cover)
          : Container(
              color: trendingColors[0],
              child: Image.asset('images/music_thumb.png', fit: BoxFit.cover),
            ),
    );
  }
}
