import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UIForm extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  String? labelText;
   UIForm({super.key, required this.controller, this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: controller,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black45,
                ),
                labelText: labelText,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffd4af37)),
                  borderRadius: BorderRadius.circular(8),
                ), 
                contentPadding:
                    const EdgeInsets.only(bottom: 14, right: 10, left: 10),
              ),
            );
  }
}