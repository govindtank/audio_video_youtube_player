class MediaItem {
  final String title;
  final String url;
  final bool isVideo;
  final String? youtubeId;

  MediaItem({required this.title, required this.url, required this.isVideo, this.youtubeId});
}
