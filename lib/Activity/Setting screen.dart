import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footwear/Authentication/Login%20Screen.dart';
import 'package:footwear/Components/dialogue%20Box.dart';
import 'package:footwear/class/ListTileClass.dart'; // Ensure this is the correct path
import 'package:footwear/class/Themedark&light.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _logot() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff991e66),
        title: Text("Account",
            style: GoogleFonts.jotiOne(
                textStyle: const TextStyle(fontSize: 28, color: Colors.white))),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              color: const Color(0xff991e66),
              child: ListTile(
                leading: const CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: AssetImage("assets/images/woman.png"),
                ),
                title: Text(
                  "Mishal Ishaq",
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white, // Add a comma here
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                subtitle: const Text(
                  "Flutter Developer || HR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                        ]),
                    child: const Center(
                      child: CustomListTile(
                        icon: Icons.home,
                        title: "Home",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                          BoxShadow(
                            blurRadius: 2,
                            color: Colors.grey,
                          ),
                        ]),
                    child: ListTile(
                      leading: const Icon(Icons.dark_mode),
                      title: const Text('Dark Mode'),
                      trailing: Switch(
                          value: Get.isDarkMode,
                          onChanged: (value) {
                            Get.changeTheme(value ? darktheme : lighttheme);
                          }),

                      // trailing: ElevatedButton(onPressed: (){
                      //   Get.changeTheme(
                      //     Get.isDarkMode? ThemeData.light(): ThemeData.dark()
                      //   );

                      // }, child: const Text("change theme")),

                      // trailing: ElevatedButton(onPressed: (){}, child: child)(){
                      // Get.changetheme(
                      //   Get.isdarktheme? ThemeData.light() : ThemeData.dark()
                      // )
                      // }
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Danger Zone",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DialogBox(
                                text: "Do you really want to log out",
                                callback: _logot);
                          });
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey,
                            ),
                            BoxShadow(
                              blurRadius: 2,
                              color: Colors.grey,
                            ),
                          ]),
                      child: const Center(
                        child: ListTile(
                          leading: Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          title: Text(
                            "Log out",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Developed by Mishal",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
