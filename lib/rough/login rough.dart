import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footwear/Authentication/Signup%20Screen.dart';
import 'package:footwear/Components/Round%20Button.dart';
import 'package:footwear/Components/Toast%20Message.dart';
import 'package:footwear/rough/profile.dart'; // Import the ImageUploads screen

class RoughLoginScreen extends StatefulWidget {
  const RoughLoginScreen({super.key});

  @override
  State<RoughLoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RoughLoginScreen> {
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Login() {
    setState(() {
      loading = true;
    });

    _auth.signInWithEmailAndPassword(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    ).then((onValue) {
      setState(() {
        loading = false;
      });

      final user = onValue.user;

      if (user != null) {
        message().toastmessage(user.email.toString());

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageUploads(
              name: user.displayName ?? 'No Name',
              email: user.email ?? 'No Email',
            ),
          ),
        );
      }
    }).onError((error, stackTrace) {
      message().toastmessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff991e66),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Sign up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Column(
                        children: [
                          const Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 26, color: Color(0xFF991e66)),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      hintText: "Email",
                      helperText: "e.g janissa@gmail.com",
                      suffixIcon: const Icon(Icons.mail_outline_outlined, size: 22),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        borderSide: const BorderSide(
                          color: Color(0xFF991e66), // Border color
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: const Icon(Icons.lock_outline, size: 22),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                        borderSide: const BorderSide(
                          color: Color(0xFF991e66), // Border color
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          RoundButton(
            text: "Login",
            loading: loading,
            callback: () {
              if (_formkey.currentState!.validate()) {
                Login();
              }
            },
          ),
          const SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                child: const Text(" Sign up ", style: TextStyle(color: Color(0xffD92B05))),
              ),
              const Text(" here"),
            ],
          ),
          const SizedBox(
            height: 37,
          ),
          Expanded(
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff991e66),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
