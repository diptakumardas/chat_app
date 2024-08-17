import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key, required this.ontap});
  final  void Function()? ontap;


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passewordController = TextEditingController();
  void login(BuildContext context)async {
    final authService = AuthService();
    try{
      await authService.signInWithEmailPassword(_emailController.text, _passewordController.text);
    }
    catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
       title: Text(e.toString()),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).colorScheme.primary),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextfield(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(
              height: 10,
            ),
            MyTextfield(
              hintText: "Password",
              obscureText: true,
              controller: _passewordController,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              title: "Login",
              ontap: () => login(context),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
