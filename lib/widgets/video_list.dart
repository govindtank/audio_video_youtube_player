import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/media_provider.dart';
import '../models/media_item.dart';

class VideoList extends StatelessWidget {
  final List<MediaItem> videos = [
    MediaItem(title: 'Sample Video 1', url: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', isVideo: true),
    MediaItem(title: 'Sample Video 2', url: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4', isVideo: true),
    MediaItem(title: 'Sample Video 3', url: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4', isVideo: true),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return ListTile(
          title: Text(video.title),
          onTap: () {
            Provider.of<MediaProvider>(context, listen: false).playMedia(video);
          },
        );
      },
    );
  }
}
