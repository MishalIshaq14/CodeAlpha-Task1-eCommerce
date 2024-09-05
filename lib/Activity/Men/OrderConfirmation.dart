import 'package:flutter/material.dart';
import 'package:footwear/Activity/Home%20Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your Order is Confirmed...",
                style: GoogleFonts.jotiOne(
                    textStyle: const TextStyle(
                        color: Color(
                          0xff991e66,
                        ),
                        fontSize: 24)),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0NOymqTvhtYimkwN_V2xq3g5goOV4WOx9aVmAny9V2PrOQS1FbihCUU2RjK8dfFDTK8I&usqp=CAU"),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Thank you for your Purchase!",
                    style: GoogleFonts.jotiOne(
                        textStyle: const TextStyle(
                            color: Color(
                              0xff991e66,
                            ),
                            fontSize: 24)),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color(0xffd4af37),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      "Back to Shopping",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
