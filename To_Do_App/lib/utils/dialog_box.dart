import 'package:flutter/material.dart';
import 'package:to_do_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;

  VoidCallback onSave;
  VoidCallback onCancel;

   DialogBox({
    super.key ,
    required this.controller,
    required this.onSave,
     required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          children: [
            //get user Input
            TextField(
              controller: this.controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
              ),
            ),
            Row(
              children: [
                MyButton(text: 'Save', onPressed: onSave, color: Colors.green,),
                const SizedBox(width: 8,),
                MyButton(text: 'Cancel', onPressed: onCancel, color: Colors.redAccent,)
              ],
            )
            //button -> save + cancel
          ],
        ),
      ),
    );
  }
}
