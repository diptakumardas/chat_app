import 'package:chat_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});
  final String message;
  final bool isCurrentUser;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: widget.isCurrentUser
            ? (isDarkMode ? Colors.green.shade600 : Colors.green.shade500)
            : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        widget.message,
        style: TextStyle(color:  widget.isCurrentUser ? Colors.white: Colors.black),
      ),
    );
  }
}
