import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a ??',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          onValue(textValue);
          textController.clear();
        },
        icon: const Icon(
          Icons.send_outlined,
        ),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue(value);
        textController.clear();
        //mantiene el foco del formulario
        focusNode.requestFocus();
      },
      onChanged: (value) {
        print('changed $value');
      },
    );
  }
}
