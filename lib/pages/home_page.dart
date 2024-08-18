import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/userTile.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  final ChatServices _chatService = ChatServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build user list
  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUserStream(),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return Usertile(
        text: userData["email"],
        ontap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatPage(
                        receiverEmail: userData["email"],
                        receiverID: userData["uid"],
                      )));
        },
      );
    } else {
      return Container();
    }
  }
}
