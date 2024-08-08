import 'package:flutter/material.dart';
import 'package:ohanap/src/common/template_screen.dart';
import 'package:ohanap/src/features/messages/screens/domain/chat_room_helper.dart';
import 'package:provider/provider.dart';

class ChatRoom extends StatelessWidget {
  // Attribute

  // Konstruktor
  const ChatRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TemplateScreen(
        content: Provider.of<ChatRoomHelper>(context, listen: false)
            .chatRoom(context));
  }
}
