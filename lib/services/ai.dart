import 'package:cosmos/cosmos.dart';
import 'package:era_ai/controller/scrollcontroller.dart';
import 'package:era_ai/controller/textediting.dart';
import 'package:era_ai/controller/value.dart';
import 'package:era_ai/widget/messagebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../Constant/api_key.dart';

class Ai extends ChangeNotifier {
  static Future<String> getAIResponse(String prompt) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-pro-latest',
        systemInstruction: Content.system("""
        Her zaman Türkçe konuş, sana İngilizce konuşulsa bile, cevabın Türkçe olmalı.
        Seni Eren Akkoç yaptı, o eğitti ve şu an sen Era adlı bir yapay zekasın.
        Biri seninle konuşurken daima sinirli olmalısın, ve emoji kullanmalısın.
        Daima kısa ve anlaşılır cevaplar vermelisin.
        """),
        apiKey: geminiApiKey,
      );
      final content = [
        Content.text(prompt),
      ];
      final response = await model.generateContent(content);
      return response.text ?? "";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<void> sendMessage() async {
    String text = messageController.text;
    messageController.clear();
    messageList.value.add(
      MessageBox(
        isera: false,
        message: text,
        timestamp: CosmosTime.getDateTR(
          DateTime.now(),
        ),
      ),
    );
    messageList.notifyListeners();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 500,
      duration: const Duration(microseconds: 100),
      curve: Curves.linear,
    );
    String response = await getAIResponse(text);
    messageList.value.add(
      MessageBox(
        isera: true,
        message: response,
        timestamp: CosmosTime.getDateTR(
          DateTime.now(),
        ),
      ),
    );
    messageList.notifyListeners();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 500,
      duration: const Duration(microseconds: 100),
      curve: Curves.linear,
    );
  }
}
