import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/ui/providers/char_provider.dart';
import 'package:yes_no_app/ui/widgets/chat/message_bubble.dart';
import 'package:yes_no_app/ui/widgets/chat/recibe_bubble.dart';
import 'package:yes_no_app/ui/widgets/shared/message_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jade'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://image.enjoymovie.net/hojrRF_IiFgPOv3GeeKl2BIKhLw=/256x256/smart/core/p/0qWe3J-8Wa.jpg'),
          ),
        ),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return (message.isMine())
                      ? MessageBubble(
                          message: message,
                        )
                      : RecibeBubble(
                          message: message,
                        );
                },
              ),
            ),
            MessageBox(
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
