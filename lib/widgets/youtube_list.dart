import 'package:flutter/material.dart';

import '../models/media_item.dart';
import '../screens/youtube_player_screen.dart';

class YoutubeList extends StatelessWidget {
  final List<MediaItem> youtubeVideos = [
    MediaItem(title: 'Sample YouTube Video 1', url: 'dQw4w9WgXcQ', isVideo: true),
    MediaItem(title: 'Sample YouTube Video 2', url: '3JZ_D3ELwOQ', isVideo: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: youtubeVideos.length,
      itemBuilder: (context, index) {
        final video = youtubeVideos[index];
        return ListTile(
          title: Text(video.title),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => YoutubePlayerScreen(videoId: video.url),
            ));
          },
        );
      },
    );
  }
}
