// To parse this JSON data, do
//
//     final yesNoSchema = yesNoSchemaFromJson(jsonString);

import 'dart:convert';

import 'package:yes_no_app/domain/entities/message.dart';

YesNoSchema yesNoSchemaFromJson(String str) =>
    YesNoSchema.fromJsonMap(json.decode(str));

String yesNoSchemaToJson(YesNoSchema data) => json.encode(data.toJson());

class YesNoSchema {
  final String answer;
  final bool forced;
  final String image;

  YesNoSchema({
    required this.answer,
    required this.forced,
    required this.image,
  });

  String get answerText {
    return answer == 'yes' ? 'Sí' : 'No';
  }

  factory YesNoSchema.fromJsonMap(Map<String, dynamic> json) => YesNoSchema(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageEntity() =>
      Message(text: answerText, fromWho: FromWho.hers, imageUrl: image);
}
