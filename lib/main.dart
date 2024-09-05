import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footwear/Loading%20Screen.dart';
import 'package:footwear/class/Themedark&light.dart';
import 'package:footwear/firebase_options.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FootWear());
}
class FootWear extends StatefulWidget {
  const FootWear({super.key});

  @override
  State<FootWear> createState() => _FootWearState();
}
class _FootWearState extends State<FootWear> {
  
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lighttheme,
      darkTheme: darktheme,
      themeMode: ThemeMode.system,
      title: "Foot Wear",
      color: Colors.purple,
      home:  const LoadingScreen(),
    );
  }
}



