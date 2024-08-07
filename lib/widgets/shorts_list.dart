import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ShortsList extends StatefulWidget {
  final List<String> shorts = [
    'dQw4w9WgXcQ',
    '3JZ_D3ELwOQ',
  ];

  @override
  _ShortsListState createState() => _ShortsListState();
}

class _ShortsListState extends State<ShortsList> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _handleScrollUp() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleScrollDown() {
    if (_currentIndex < widget.shorts.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollUpdateNotification) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _handleScrollDown();
          } else if (scrollInfo.metrics.pixels == scrollInfo.metrics.minScrollExtent) {
            _handleScrollUp();
          }
        }
        return true;
      },
      child: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            _handleScrollUp();
          } else if (details.primaryVelocity! < 0) {
            _handleScrollDown();
          }
        },
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: widget.shorts.length,
          itemBuilder: (context, index) {
            final shortId = widget.shorts[index];
            return YoutubeShortsPlayer(videoId: shortId);
          },
        ),
      ),
    );
  }
}

class YoutubeShortsPlayer extends StatefulWidget {
  final String videoId;

  YoutubeShortsPlayer({required this.videoId});

  @override
  _YoutubeShortsPlayerState createState() => _YoutubeShortsPlayerState();
}

class _YoutubeShortsPlayerState extends State<YoutubeShortsPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      params: const YoutubePlayerParams(
        autoPlay: false,
        desktopMode: kIsWeb ? true : false,
        showControls: false,
        showFullscreenButton: false,
        loop: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YoutubePlayerIFrame(controller: _controller),
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Text(
                  'Shorts',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(width: 48), // Placeholder to balance the back button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
