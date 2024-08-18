import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void logout(){
    final _authService = AuthService();
    _authService.signout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          DrawerHeader(
              child: Center(
            child: Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 40,
            ),
          )),
           Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.settings),
              
              title: Text("S E T T I N G S"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*.52,
          ),
           Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("L O G O U T "),
              onTap: (){logout();},
            ),
          ),

        ],
      ),
    );
  }
}
