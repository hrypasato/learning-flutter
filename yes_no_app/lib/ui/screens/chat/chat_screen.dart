import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                      ? const RecibeBubble()
                      : const MessageBubble();
                },
              ),
            ),
            const MessageBox()
          ],
        ),
      ),
    );
  }
}
