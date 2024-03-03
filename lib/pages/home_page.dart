
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
            // instnce of auth

    final FirebaseAuth _auth = FirebaseAuth.instance;  


  void signOut(){
    // get auth servide
    final authService = Provider.of<AuthService>(context, listen: false) ;
    authService.signOut() ;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),

        actions: [
          IconButton(
          onPressed: signOut,
          icon: const Icon(Icons.logout),

          )
        ],
      ),

    body: _buildUserList(),

    );
  }

// build a list of users of users except for the  urrnet logged in user
  Widget _buildUserList() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('users').snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const Text("error..");
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("loading ho raha hai...");
      }

      return ListView(
        children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
      );
    },
  );
}


 Widget _buildUserListItem(DocumentSnapshot document) {
  Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

  // Check if data is not null and contains required properties
  if (data != null && data.containsKey('email') && data.containsKey('uid')) {
    // display all users except current users 
    if (_auth.currentUser?.email != data['email']) {
      return ListTile(
        title: Text(data['email'] as String),  // Wrap the email in Text widget
        onTap: () {
          // pass the clicked user's UID to the chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverUserEmail: data['email'] as String,
                receiverUserId: data['uid'] as String,
              ),
            ),
          );
        },
      );
    }
  }

  return Container();  // Return an empty container if the conditions are not met
}



}