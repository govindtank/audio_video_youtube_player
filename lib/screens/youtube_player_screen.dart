import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePlayerScreen extends StatelessWidget {
  final String videoId;

  YoutubePlayerScreen({required this.videoId});

  @override
  Widget build(BuildContext context) {
    final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoId,
      params: YoutubePlayerParams(
        autoPlay: true,
        showControls: true,
        showFullscreenButton: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Player'),
      ),
      body: Center(
        child: YoutubePlayerIFrame(
          controller: _controller,
        ),
      ),
    );
  }
}
