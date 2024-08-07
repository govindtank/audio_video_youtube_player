import 'package:audio_video_youtube_player/screens/shorts_by_video_url.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/audio_list.dart';
import '../widgets/mini_player.dart';
import '../widgets/shorts_list.dart';
import '../widgets/video_list.dart';
import '../widgets/youtube_list.dart';
import 'VideoListPage.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Player'),
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.audiotrack), text: 'Audio'),
                      Tab(icon: Icon(Icons.videocam), text: 'Video'),
                      Tab(icon: Icon(Icons.video_library), text: 'YouTube'),
                      Tab(icon: Icon(Icons.short_text), text: 'Shorts'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AudioList(),
                        VideoList(),
                        YoutubeList(),
                        VideoListPage()
                        // ShortsByVideoUrl()
                        // ShortsList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}
