import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

VideoSchema videoSchemaFromJson(String str) =>
    VideoSchema.fromJsonMap(json.decode(str));

String videoSchemaToJson(VideoSchema data) => json.encode(data.toJson());

class VideoSchema {
  final String name;
  final String videoUrl;
  final int likes;
  final int view;

  VideoSchema({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.view = 0,
  });

  factory VideoSchema.fromJsonMap(Map<String, dynamic> json) => VideoSchema(
        name: json["name"] ?? 'unknow',
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        view: json["views"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": view,
      };

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: view);
}
