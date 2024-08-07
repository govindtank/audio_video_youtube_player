import 'package:flutter/material.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeShortsScreen extends StatelessWidget {
  const YoutubeShortsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> shorts = [
      'dQw4w9WgXcQ',
      '3JZ_D3ELwOQ',
    ];

    return MaterialApp(
      home: ShortsWidget(
        shorts: shorts,
      ),
    );
  }
}

class ShortsWidget extends StatefulWidget {
  const ShortsWidget({
    Key? key,
    required this.shorts,
    this.testingController,
  }) : super(key: key);

  // This is a parameter to support testing in this repo
  final Controller? testingController;
  final List<String> shorts;

  @override
  State<ShortsWidget> createState() => _ShortsWidgetState();
}

class _ShortsWidgetState extends State<ShortsWidget> {
  late Controller controller;

  @override
  initState() {
    controller = widget.testingController ?? Controller()
      ..addListener((event) {
        _handleCallbackEvent(event);
      });

    // controller.jumpToPosition(4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TikTokStyleFullPageScroller(
          contentSize: widget.shorts.length,
          swipePositionThreshold: 0.2,
          // ^ the fraction of the screen needed to scroll
          swipeVelocityThreshold: 2000,
          // ^ the velocity threshold for smaller scrolls
          animationDuration: const Duration(milliseconds: 400),
          // ^ how long the animation will take
          controller: controller,
          // ^ registering our own function to listen to page changes
          builder: (BuildContext context, int index) {
            return Container(
              color: Colors.white,
              child: Stack(children: [
                Center(
                  child: IgnorePointer(
                    ignoring: true,
                    child: YoutubePlayerIFrame(
                      controller: YoutubePlayerController(
                          params: YoutubePlayerParams(
                              showControls: false,
                              autoPlay: false,
                              playsInline: true,
                              showFullscreenButton: false,
                              strictRelatedVideos: false),
                          initialVideoId: widget.shorts[index]),
                      aspectRatio: 11 / 16,
                    ),
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }

  void _handleCallbackEvent(ScrollEvent event) {
    print(
        "Scroll callback received with data: {direction: ${event.direction}, success: ${event.success} and page: ${event.pageNo ?? 'not given'}}");
    if (event.percentWhenReleased != null) {
      print("Percent when released: ${event.percentWhenReleased}");
    }
  }
}
