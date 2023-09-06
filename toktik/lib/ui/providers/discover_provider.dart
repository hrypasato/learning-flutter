import 'package:flutter/material.dart';
import 'package:toktik/core/schemas/video_schema.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => VideoSchema.fromJsonMap(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    //cargar videos
    notifyListeners();
  }
}
