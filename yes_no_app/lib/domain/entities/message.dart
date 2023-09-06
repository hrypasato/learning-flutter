enum FromWho { me, hers }

abstract class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
  Message.named({required this.text, this.imageUrl, required this.fromWho});

  bool isMine() {
    return fromWho == FromWho.me;
  }

  bool isQuestion() {
    return text.endsWith('?');
  }
}

class MessageSend extends Message {
  MessageSend({required super.text, super.imageUrl})
      : super.named(fromWho: FromWho.me);
}

class MessageInbox extends Message {
  MessageInbox({required super.text, super.imageUrl})
      : super.named(fromWho: FromWho.hers);
}
