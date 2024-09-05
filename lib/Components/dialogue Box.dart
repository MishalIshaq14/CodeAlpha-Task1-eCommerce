import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  final String text;
  VoidCallback callback;
   DialogBox({super.key, required this.text, required this.callback});

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
            title: Text(widget.text, style: const TextStyle(
              fontSize: 16
            ),),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Center(
                          child: Text("cancel",style: TextStyle(color: Colors.black45, fontSize: 14),),
                        )),
                        TextButton(
                        onPressed: widget.callback,
                        child: const Center(
                          child: Text("OK",style: TextStyle(color: Colors.red, fontSize: 14),),
                        )),
                  ],
                ),
              )
            ],
          );
  }
}