import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Usertile extends StatefulWidget {
  const Usertile({super.key, required this.text, this.ontap});
  final String text;
  final void Function()? ontap;
  @override
  State<Usertile> createState() => _UsertileState();
}

class _UsertileState extends State<Usertile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),

            ),
            margin: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 20,
                ),
                Text(widget.text),
              ],
            ),

    ),
    );
  }
}
