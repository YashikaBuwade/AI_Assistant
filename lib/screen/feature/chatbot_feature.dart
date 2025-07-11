import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ai_assistant/controller/chat_controller.dart';
import 'package:ai_assistant/widget/message_card.dart';
import '../../helper/global.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat with AI Assistant')),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(children: [
          // Text input
          Expanded(
            child: TextFormField(
              controller: _c.textC,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                fillColor: Colors.black12,
                filled: true,
                isDense: true,
                hintText: 'Ask me anything...',
                hintStyle: TextStyle(fontSize: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Send button
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blue,
            child: IconButton(
              onPressed: _c.askQuestion,
              icon: const Icon(Icons.send, color: Colors.white, size: 24),
            ),
          ),
        ]),
      ),

      body: Obx(
            () => ListView(
              physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
