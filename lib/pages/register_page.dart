import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.ontap});
  final void Function()? ontap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passewordController = TextEditingController();
  TextEditingController _confirmpassewordController = TextEditingController();
  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passewordController == _confirmpassewordController) {
      try {
        _auth.signUpWithEmailPassword(
            _emailController.text, _passewordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(title: Text(e.toString())));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text("Password didnt match")));
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
              "Welcome!! You've been missed!!",
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
              height: 10,
            ),
            MyTextfield(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpassewordController,
            ),
            SizedBox(
              height: 25,
            ),
            MyButton(
              title: "Register",
              ontap: (){
                register(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: widget.ontap,
                  child: Text(
                    "Login",
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
