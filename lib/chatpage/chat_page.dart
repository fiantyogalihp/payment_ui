import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_ui/chatpage/chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        child: Center(
          child: Text(
            'Ini button navigator',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
