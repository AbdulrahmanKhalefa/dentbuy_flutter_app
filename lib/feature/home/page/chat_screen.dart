import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name; // 👈 استلام اسم الشخص

  const ChatScreen({super.key, required this.name});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatMessage {
  final String text;
  final bool isSender;

  _ChatMessage({required this.text, required this.isSender});
}

class _ChatScreenState extends State<ChatScreen> {
  final List<_ChatMessage> _messages = [
    _ChatMessage(text: 'Hello! Is this item still available?', isSender: false),
    _ChatMessage(text: 'Yes, it is ready for pickup or delivery.', isSender: true),
    _ChatMessage(text: 'Great, can you share the condition?', isSender: false),
  ];

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(_ChatMessage(text: text, isSender: true));
    });

    _messageController.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name), // 👈 اسم الشخص بدل النص الثابت
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];

                return Align(
                  alignment: message.isSender
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: message.isSender
                          ? const Color(0xFF1E88E5)
                          : const Color(0xFFF1F3F6),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft:
                            Radius.circular(message.isSender ? 16 : 4),
                        bottomRight:
                            Radius.circular(message.isSender ? 4 : 16),
                      ),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(
                        color: message.isSender
                            ? Colors.white
                            : Colors.black87,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 👇 input area
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFFE5E5E5))),
              color: Colors.white,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      onSubmitted: (_) => _sendMessage(), // 👈 send من الكيبورد
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        filled: true,
                        fillColor: const Color(0xFFF7F8FA),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF1E88E5),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
