// import 'package:flutter/material.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// // import 'package:youtube_shorts/youtube_shorts.dart';
//
// class ShortsByVideoUrl extends StatefulWidget {
//   const ShortsByVideoUrl({super.key});
//
//   @override
//   State<ShortsByVideoUrl> createState() => _ShortsByVideoUrlState();
// }
//
// class _ShortsByVideoUrlState extends State<ShortsByVideoUrl> {
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   final TextEditingController _textEditingController = TextEditingController();
//
//   @override
//   void dispose() {
//     super.dispose();
//     _textEditingController.dispose();
//   }
//
//   List<String> links = [
//     'https://www.youtube.com/shorts/PiWJWfzVwjU', // 0
//     'https://www.youtube.com/shorts/AeZ3dmC676c', // 1
//     'https://www.youtube.com/shorts/L1lg_lxUxfw', // 2
// /*    'https://www.youtube.com/shorts/OWPsdhLHK7c', // 3
//     'https://www.youtube.com/shorts/GoQhFyoZxRM', // 4
//     'https://www.youtube.com/shorts/pzpp3PkVI-s', // 5
//     'https://www.youtube.com/shorts/Z9yyWrbonRs', // 6
//     'https://www.youtube.com/shorts/LPm0LUBxnRQ', // 7
//     'https://www.youtube.com/shorts/sG0lMuv88yg', // 8
//     'https://www.youtube.com/shorts/HEwvgMxsLcI', // 9
//     'https://www.youtube.com/shorts/8I1Gq1xW8L4', // 10
//     'https://www.youtube.com/shorts/tL7D5bivyH4', // 11
//     'https://www.youtube.com/shorts/7TVj_KqJ0wY', // 12
//     'https://www.youtube.com/shorts/GYqF_LXFlyg', // 13
//     'https://www.youtube.com/shorts/Il5rxWOw4GI', // 14
//     'https://www.youtube.com/shorts/a3XT1p7Uczk', // 15
//     'https://www.youtube.com/shorts/1S-c0yLCsNo', // 16
//     'https://www.youtube.com/shorts/S23UPbRai-w', // 17
//     'https://www.youtube.com/shorts/ZCDU4O1jnTo', // 18*/
//   ];
//
//   bool seeHorizontalVideos = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('By url list'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               if (links.isEmpty) {
//                 links.clear();
//                 setState(() {});
//               }
//             },
//             icon: const Icon(Icons.delete),
//             tooltip: 'Delete all fields',
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//
//           const SizedBox(height: 40),
//           // YoutubePlayerScaffold()
//         ],
//       ),
//     );
//   }
// }
//
// class ShortsByVideoUrlDisplay extends StatefulWidget {
//   final List<String> ids;
//   final bool seeHorizontalVideos;
//   const ShortsByVideoUrlDisplay({
//     super.key,
//     required this.ids,
//     required this.seeHorizontalVideos,
//   });
//
//   @override
//   State<ShortsByVideoUrlDisplay> createState() =>
//       _ShortsByVideoStateUrlDisplay();
// }
//
// class _ShortsByVideoStateUrlDisplay extends State<ShortsByVideoUrlDisplay> {
//   // late final ShortsController controller;
//
//   late YoutubePlayerController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     // controller = ShortsController(
//     //   youtubeVideoSourceController: VideosSourceController.fromUrlList(
//     //     videoIds: widget.ids,
//     //   ),
//     // );
//     controller=YoutubePlayerController(initialVideoId: (widget.ids[0]));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return YoutubePlayerIFrame(
//       controller: controller,
//       aspectRatio: 16 / 9,
//     );
//  /*   if (widget.seeHorizontalVideos) {
//       return Scaffold(
//         body: Center(
//           child: YoutubeShortsHorizontalStoriesSection(
//             shortsPreviewHeight: 295,
//             controller: controller,
//           ),
//         ),
//       );
//     } else {
//       return YoutubeShortsPage(
//         controller: controller,
//         overlayWidgetBuilder: (
//             int index,
//             PageController pageController,
//             VideoController videoController,
//             Video videoData,
//             MuxedStreamInfo hostedVideoUrl,
//             ) {
//           return Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 100, left: 16),
//               child: CircleAvatar(
//                 child: Text('$index'),
//               ),
//             ),
//           );
//         },
//       );*/
//     }
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }