import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/media_provider.dart';
import '../screens/now_playing_screen.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, mediaProvider, child) {
        if (mediaProvider.currentMedia == null) {
          return SizedBox.shrink();
        }
        return ListTile(
          title: Text(mediaProvider.currentMedia!.title),
          trailing: IconButton(
            icon: Icon(mediaProvider.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: mediaProvider.togglePlayPause,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => NowPlayingScreen(),
            ));
          },
        );
      },
    );
  }
}
