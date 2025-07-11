import 'package:ai_assistant/model/message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.msgType == MessageType.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8, // ✅ prevent overflow
        ),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue : Colors.grey.shade900,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: Radius.circular(isUser ? 12 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 12),
          ),
        ),
        child: Text(
          message.msg,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          softWrap: true, // ✅ wrap text
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}

