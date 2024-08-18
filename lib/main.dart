
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode ,

    );
  }
}
