import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/media_provider.dart';
import '../models/media_item.dart';

class AudioList extends StatelessWidget {
  final List<MediaItem> audios = [
    MediaItem(title: 'Sample Audio 1', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', isVideo: false),
    MediaItem(title: 'Sample Audio 2', url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3', isVideo: false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: audios.length,
      itemBuilder: (context, index) {
        final audio = audios[index];
        return ListTile(
          title: Text(audio.title),
          onTap: () {
            Provider.of<MediaProvider>(context, listen: false).playMedia(audio);
          },
        );
      },
    );
  }
}
