import 'package:flutter/material.dart';
import 'package:yes_no_app/core/services/yes_no_service.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final yesNoService = YesNoService();

  List<Message> messageList = [
    MessageSend(text: 'Hola amor!'),
    MessageSend(text: 'Que tal tu dia de trabajo?'),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = MessageSend(text: text);
    messageList.add(newMessage);

    if (newMessage.isQuestion()) {
      reply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }

  Future<void> reply() async {
    final responseMessage = await yesNoService.getAnswer();
    messageList.add(responseMessage);
    notifyListeners();
    moveScrollToBottom();
  }
}
