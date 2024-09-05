import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final IconData icon;
  final String title ;
  final Widget? trailing;

  const CustomListTile({super.key, required this.icon, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title,),
      trailing: trailing
    );
  }
}


