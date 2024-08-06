import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ShortsList extends StatelessWidget {
  final List<String> shorts = [
    'dQw4w9WgXcQ',
    '3JZ_D3ELwOQ',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: shorts.length,
      itemBuilder: (context, index) {
        return YoutubePlayerIFrame(
          controller: YoutubePlayerController(
            initialVideoId: shorts[index],
            params: YoutubePlayerParams(
              autoPlay: true,
              showControls: true,
              showFullscreenButton: false,
            ),
          ),
        );
      },
    );
  }
}
