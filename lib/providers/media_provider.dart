import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';
import '../models/media_item.dart';

class MediaProvider with ChangeNotifier {
  MediaItem? _currentMedia;
  bool _isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  VideoPlayerController? videoPlayerController;

  MediaItem? get currentMedia => _currentMedia;
  bool get isPlaying => _isPlaying;

  void playMedia(MediaItem mediaItem) async {
    _currentMedia = mediaItem;
    _isPlaying = true;
    if (mediaItem.isVideo) {
      videoPlayerController?.dispose();
      videoPlayerController = VideoPlayerController.network(mediaItem.url)
        ..initialize().then((_) {
          videoPlayerController!.play();
          notifyListeners();
        });
    } else {
      await _audioPlayer.setUrl(mediaItem.url);
      _audioPlayer.play();
    }
    notifyListeners();
  }

  void togglePlayPause() {
    if (_isPlaying) {
      _isPlaying = false;
      _currentMedia!.isVideo ? videoPlayerController?.pause() : _audioPlayer.pause();
    } else {
      _isPlaying = true;
      _currentMedia!.isVideo ? videoPlayerController?.play() : _audioPlayer.play();
    }
    notifyListeners();
  }

  void stopMedia() {
    _isPlaying = false;
    _currentMedia!.isVideo ? videoPlayerController?.dispose() : _audioPlayer.stop();
    _currentMedia = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    videoPlayerController?.dispose();
    super.dispose();
  }
}
