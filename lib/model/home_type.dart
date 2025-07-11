import 'package:ai_assistant/screen/feature/chatbot_feature.dart';
import 'package:ai_assistant/screen/feature/translator_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum HomeType { aiChatBot, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
    HomeType.aiChatBot => 'AI ChatBot',
    HomeType.aiTranslator => 'Language Translator',
  };

  String get lottie => switch (this) {
    HomeType.aiChatBot => 'ai_hand_waving.json',
    HomeType.aiTranslator => 'ai_ask_me.json',
  };

  bool get leftAlign => switch (this) {
    HomeType.aiChatBot => true,
    HomeType.aiTranslator => true,
  };

  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiTranslator => EdgeInsets.zero,
  };

  VoidCallback get onTap => switch (this) {
    HomeType.aiChatBot => () => Get.to(() => const ChatbotFeature()),
    HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
  };
}

