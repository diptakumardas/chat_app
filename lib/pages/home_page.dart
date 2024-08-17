import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void logout(){
    final _authService = AuthService();
    _authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        actions: [
          InkWell(
              onTap: logout,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.logout_outlined),
              ))
        ],
      ),
    );
  }
}
