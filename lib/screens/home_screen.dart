import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/audio_list.dart';
import '../widgets/video_list.dart';
import '../widgets/mini_player.dart';
import '../widgets/youtube_list.dart';
import '../widgets/shorts_list.dart';
import '../providers/media_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Player'),
      ),
      body: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  TabBar(
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
                        ShortsList(),
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
