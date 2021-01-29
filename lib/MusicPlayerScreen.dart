import 'dart:developer';

import 'package:devotion/bloc/blocs/list.bloc.dart';
import 'package:devotion/bloc/blocs/player.bloc.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/BottomSheetLine.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:devotion/widgets/PlayerTabsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  final AudioPost playable;
  MusicPlayerScreen({this.playable});
  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with TickerProviderStateMixin {
  double playedRatio = 0;

  double sheetPositionTop = 280;
  bool isDocked = false;
  int activeSlide = 0;

  TabController _tabController;
  AudioPlayer audioPlayer = AudioPlayer();

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

    playMusic(widget.playable);
    super.initState();
  }

  playMusic(AudioPost audio) async {
    var duration = await audioPlayer.setUrl(rootURL + audio.srcUrl);
//    var item = MediaItem(
//      id: widget.playable.srcUrl,
//      album: 'Devotion Albums',
//      artist: widget.playable.author.name,
//      title: widget.playable.name,
//    );
//    AudioService.playMediaItem(item);
    audioPlayer.play();
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
                    player: audioPlayer,
                    size: size,
                    height: sheetPositionTop,
                  ),
            AudioControls(
              size: size,
              player: audioPlayer,
            ),
            Positioned(
              top: sheetPositionTop - 5,
              child: AudioSlider(
                size: size,
                player: audioPlayer,
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
                              video: widget.playable,
                              playedType: PlayedType.audio,
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
    this.size,
    this.player,
  });
  final Size size;
  final AudioPlayer player;
  @override
  _AudioControlsState createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  bool isControlsVisible = true;
  double height = 280;
  bool isPlaying = false;
  bool isLoaded = false;
  bool isError = false;
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
    AudioService.playbackStateStream.listen((PlaybackState state) {
      if (state.playing)
        isPlaying = true;
      else {
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
    super.initState();
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
                        isPlaying
                            ? Container(
                                width: widget.size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50,
                                    vertical: 30 / 540 * height),
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
                                          if (isPlaying) {
                                            widget.player.pause();
                                          } else {
                                            widget.player.play();
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
                                    child: CircularProgressIndicator(),
                                  )
                                : Container(
                                    height: height - 86,
                                    width: widget.size.width,
                                    alignment: Alignment.center,
                                    child: Icon(Icons.refresh,
                                        color: trendingColors[0], size: 45),
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
    Key key,
    @required this.size,
    @required this.player,
  }) : super(key: key);

  final Size size;
  final AudioPlayer player;

  @override
  _AudioSliderState createState() => _AudioSliderState();
}

class _AudioSliderState extends State<AudioSlider> {
  double sliderPos = 0;
  double duration = 0;
  void sliderChanged(val) {
    setState(() {
      sliderPos = val;
    });
    AudioService.seekTo(Duration(seconds: val.round()));
  }

  @override
  void initState() {
    AudioService.positionStream.listen((Duration position) {
      sliderPos = position.inSeconds.toDouble();
    });
    AudioService.currentMediaItemStream.listen((MediaItem item) {
      duration = item.duration.inSeconds.toDouble();
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
    @required this.size,
    @required this.audio,
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
  final AudioPlayer player;
  const AudioWidget({this.size, this.height, this.audio, this.player});
  @override
  Widget build(BuildContext context) {
    return Container(
//      padding: EdgeInsets.only(top:22),
      width: size.width,
      height: height + 30,
      child: audio.images != null
          ? Image.network(audio.images[0].mediumUrl, fit: BoxFit.cover)
          : Image.asset('images/music_thumb.png', fit: BoxFit.cover),
    );
  }
}
