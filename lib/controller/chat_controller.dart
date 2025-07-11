import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../apis/apis.dart';
import '../model/message.dart';

class ChatController extends GetxController {
  final textC = TextEditingController();
  final scrollC = ScrollController(); // FIXED: ScrollController

  final list = <Message>[
    Message(msg: 'Hello, How can I help you?', msgType: MessageType.bot),
  ].obs;

  bool useGemini = true;

  Future<void> askQuestion() async {
    final question = textC.text.trim();
    if (question.isEmpty) return;

    list.add(Message(msg: question, msgType: MessageType.user));
    list.add(Message(msg: 'Please wait...', msgType: MessageType.bot));

    final answer = useGemini
        ? await APIs.getGeminiAnswer(question)
        : await APIs.getOpenAIAnswer(question);

    list.removeLast();
    list.add(Message(msg: answer, msgType: MessageType.bot));
    textC.clear();
  }
}




