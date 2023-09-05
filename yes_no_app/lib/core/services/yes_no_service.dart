import 'package:dio/dio.dart';
import 'package:yes_no_app/core/schemas/yes_no_schema.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoService {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoSchema = YesNoSchema.fromJsonMap(response.data);

    return yesNoSchema.toMessageEntity();
  }
}
