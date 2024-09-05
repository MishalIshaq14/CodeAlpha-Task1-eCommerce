import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:footwear/Activity/Home%20Screen.dart';
import 'package:footwear/Authentication/Login%20Screen.dart';
import 'package:footwear/Components/Round%20Button.dart';
import 'package:footwear/Components/Toast%20Message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool loading = false;

  final _formkey = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

//   signup()async{
//     try {
//   final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//     email: emailcontroller.text,
//     password: passwordcontroller.t
//   );
// } on FirebaseAuthException catch (e) {
//   if (e.code == 'user-not-found') {
//     print('No user found for that email.');
//   } else if (e.code == 'wrong-password') {
//     print('Wrong password provided for that user.');
//   }
// }
//   }

  void signup() {
    setState(() {
      loading = true;
    });

    _auth
        .createUserWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((onvalue) {
      setState(() {
        loading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));

      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      message().toastmessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 20,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(
              0xff991e66,
            ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 2,
                              color: Colors.white,
                            )
                          ],
                        ),
                        const Text(
                          "Sign in",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    )
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
                  "Create an Account",
                  style: TextStyle(fontSize: 26, color: Color(0xFF991e66)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernamecontroller,
                      decoration: InputDecoration(
                        hintText: "Username",
                        suffixIcon: const Icon(
                          Icons.person_outline,
                          size: 22,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF991e66), // Border color
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter username";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        hintText: "Email",
                        helperText: "e.g janissa@gmail.com",
                        suffixIcon:
                            const Icon(Icons.mail_outline_outlined, size: 22),
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
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "password",
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
              height: 50,
            ),
            RoundButton(
                text: "Sign up",
                loading: loading,
                // ignore: void_checks
                callback: () {
                  if (_formkey.currentState!.validate()) {
                    signup();
                  }
                }),
                const SizedBox(height: 70,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(" Log in ",
                              style: TextStyle(color: Color(0xffD92B05)))),
                      const Text(
                        "here",
                      ),
                    ],
                  ),
            const SizedBox(
              height: 27,
            ),
            Expanded(
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(
              0xff991e66,
            ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
              ),
            )
          ],
        ),
    );
  }
}
