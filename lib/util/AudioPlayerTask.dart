import 'package:audio_service/audio_service.dart';
import 'package:devotion/models/AudioPost.dart';
import 'package:devotion/util/Constants.dart';
import 'package:just_audio/just_audio.dart';

void audioEntryPoint() => AudioServiceBackground.run(() => AudioPlayerTask());

class AudioPlayerTask extends BackgroundAudioTask {
  final _player = AudioPlayer(); // e.g. just_audio
  onPlay() => _player.play();
  onPause() => _player.pause();
  onSeekTo(Duration duration) => _player.seek(duration);
  onSetSpeed(double speed) => _player.setSpeed(speed);

  onStop() async {
    // Stop and dispose of the player.
    await _player.dispose();
    // Shut down the background task.
    await super.onStop();
  }

  onStart(Map<String, dynamic> params) async {
    // final mediaItem = MediaItem(
    //   id: ROOT_URL + '/storage/audio/Hillsong-Touch-Of-Heaven.mp3',
    //   album: "Foo",
    //   title: "Touch Of Heaven",
    // );
    // Tell the UI and media notification what we're playing.
    // AudioServiceBackground.setMediaItem(mediaItem);
    // Listen to state changes on the player...
    _player.playerStateStream.listen((playerState) {
      // ... and forward them to all audio_service clients.
      AudioServiceBackground.setState(
        playing: playerState.playing,
        // Every state from the audio player gets mapped onto an audio_service state.
        processingState: {
          ProcessingState.idle: AudioProcessingState.none,
          ProcessingState.loading: AudioProcessingState.connecting,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[playerState.processingState],
        // Tell clients what buttons/controls should be enabled in the
        // current state.
        controls: [
          playerState.playing ? MediaControl.pause : MediaControl.play,
          MediaControl.stop,
        ],
      );
    });
    // Play when ready.
    // await _player.setUrl(mediaItem.id);
    // _player.play();
    // Start loading something (will play when ready).
  }

  onCustomAction(String name, dynamic arguments) async {
    switch (name) {
      case 'setVolume':
        _player.setVolume(arguments);
        break;
      case 'saveBookmark':
        // app-specific code
        break;
      case 'playAudio':
        final mediaItem = MediaItem(
          id: ROOT_URL + '/storage/audio/Hillsong-Touch-Of-Heaven.mp3',
          album: "Foo",
          title: "Touch Of Heaven",
        );
        await _player.setUrl(mediaItem.id);
        await _player.play();
        break;
    }
  }
}
