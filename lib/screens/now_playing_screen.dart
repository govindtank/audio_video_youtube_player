import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../providers/media_provider.dart';

class NowPlayingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaProvider = Provider.of<MediaProvider>(context);
    final mediaItem = mediaProvider.currentMedia;

    if (mediaItem == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Now Playing'),
        ),
        body: const Center(
          child: Text('No media playing'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (mediaItem.isVideo && mediaProvider.videoPlayerController != null)
            AspectRatio(
              aspectRatio: mediaProvider.videoPlayerController!.value.aspectRatio,
              child: VideoPlayer(mediaProvider.videoPlayerController!),
            ),
          Text(mediaItem.title, style: const TextStyle(fontSize: 24)),
          IconButton(
            icon: Icon(mediaProvider.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: mediaProvider.togglePlayPause,
            iconSize: 64,
          ),
        ],
      ),
    );
  }
}
