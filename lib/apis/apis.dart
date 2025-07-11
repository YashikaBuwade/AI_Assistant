import 'dart:convert';
import 'package:http/http.dart' as http;
import '../helper/global.dart';

class APIs {
  // 🔹 OpenAI Chat Completion
  static Future<String> getOpenAIAnswer(String question) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final res = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $openaiApiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": question}
        ],
      }),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data['choices'][0]['message']['content'];
    } else {
      return 'OpenAI Error: \${res.statusCode}';
    }
  }

  // 🔹 Gemini Chat Completion
  static Future<String> getGeminiAnswer(String question) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$geminiApiKey',
    );

    final res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": question}
            ]
          }
        ]
      }),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      return "Gemini Error: \${res.statusCode}";
    }
  }
}










