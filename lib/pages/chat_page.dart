import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:chat_app/services/auth/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;

  const ChatPage({
    super.key,
    required this.receiverUserId,
    required this.receiverUserEmail,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.trim().isNotEmpty) {
      await _chatService.sendMessage(
        widget.receiverUserId,
        _messageController.text.trim(),
      );
      _messageController.clear();

      // Scroll to bottom after sending
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          const Divider(height: 1),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
        widget.receiverUserId,
        _firebaseAuth.currentUser!.uid,
      ),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = snapshot.data?.docs ?? [];

        return ListView.builder(
          reverse: true,
          controller: _scrollController,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final messageData = messages[messages.length - 1 - index];
            return _buildMessageItem(messageData);
          },
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final isMe = data['senderId'] == _firebaseAuth.currentUser!.uid;

    return ChatBubble(
      message: data['message'],
      isMe: isMe,
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: 'Type a message',
              obscureText: false,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: sendMessage,
            child: const Icon(Icons.send, size: 30, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
