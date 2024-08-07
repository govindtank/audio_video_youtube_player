// import 'package:flutter/material.dart';
//
// class ShortsList extends StatefulWidget {
//   @override
//   _ShortsListState createState() => _ShortsListState();
// }
//
// class _ShortsListState extends State<ShortsList> {
//   final List<String> shortsVideos = [
//     'https://youtu.be/9bZkp7q19f0',
//     'https://youtu.be/dQw4w9WgXcQ',
//   ];
//
//   late PageController _pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       scrollDirection: Axis.vertical,
//       itemCount: shortsVideos.length,
//       itemBuilder: (context, index) {
//         return YoutubePlayer(
//           controller: YoutubePlayerController(
//             initialVideoId: YoutubePlayer.convertUrlToId(shortsVideos[index])!,
//             flags: const YoutubePlayerFlags(
//               autoPlay: true,
//               loop: true,
//             ),
//           ),
//           showVideoProgressIndicator: true,
//         );
//       },
//     );
//   }
// }
