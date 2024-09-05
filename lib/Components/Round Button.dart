import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  String text;
  final VoidCallback callback;
  bool loading;

  RoundButton(
      {super.key,
      required this.text,
      required this.callback,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Color(0xff991e66)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 2, color: Color(0xFFd5bbb1))
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  )),
      ),
    );
  }
}
