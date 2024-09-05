import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:footwear/Activity/Men/Bottom%20Navigaion.dart';
import 'package:google_fonts/google_fonts.dart'; // Import for the BackdropFilter and ImageFilter

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xff991e66,
        ),
        title: Text("Foot Wear",
            style: GoogleFonts.jotiOne(
                textStyle: const TextStyle(fontSize: 28, color: Colors.white))),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              "data:image/jpeg;base64,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", // Replace with your image URL
              fit: BoxFit.cover,
            ),
          ),
          // BackdropFilter to apply a blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(
                color: Colors.black.withOpacity(0.3), // Optional: to add a tint
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigaion()));
                          },
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xffd4af37),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: const Color(0xffc98ca7),
                                  ),
                                ]),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: 70,
                                      width: 70,
                                      child: const Image(
                                        image: AssetImage(
                                          "assets/images/men.png",
                                        ),
                                        fit: BoxFit.fitHeight,
                                      )),
                                  const Text(
                                    "Men",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffd4af37),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color(0xffc98ca7),
                                ),
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 70,
                                    width: 70,
                                    child: const Image(
                                      image: AssetImage(
                                        "assets/images/woman.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                const Text(
                                  "Women",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffd4af37),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color(0xffc98ca7),
                                ),
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 70,
                                    width: 55,
                                    child: const Image(
                                      image: AssetImage(
                                        "assets/images/kid.png",
                                      ),
                                      fit: BoxFit.fill,
                                    )),
                                const Text(
                                  "Kids",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffd4af37),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2,
                                  color: Color(0xffc98ca7),
                                ),
                              ]),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 70,
                                    width: 70,
                                    child: const Image(
                                      image: AssetImage(
                                        "assets/images/sale.png",
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                                const Text(
                                  "Sale",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:footwear/Activity/Men/Bottom%20Navigaion.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   var category = ["Men", "Women", "Kids", "Sale"];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(
//             0xff991e66,
//           ),
//           title: Text("Foot Wear",
//               style: GoogleFonts.jotiOne(
//                   textStyle:
//                       const TextStyle(fontSize: 28, color: Colors.white))),
//           iconTheme: const IconThemeData(color: Colors.white),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.shopping_bag_outlined,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//           ],
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const BottomNavigaion()));
//                 },
//                 child: Container(
//                   height: 70,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                       color: Color(0xff991e66),
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: const [
//                         BoxShadow(
//                           blurRadius: 2,
//                           color: const Color(0xffc98ca7),
//                         ),
//                       ]),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                             height: 70,
//                             width: 70,
//                             child: const Image(
//                               image: AssetImage(
//                                 "assets/images/men.png",
//                               ),
//                               fit: BoxFit.fitHeight,
//                             )),
//                         const Text(
//                           "Men",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600),
//                         )
//                       ]),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 70,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Color(0xff991e66),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       BoxShadow(
//                         blurRadius: 2,
//                         color: Color(0xffc98ca7),
//                       ),
//                     ]),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           height: 70,
//                           width: 70,
//                           child: const Image(
//                             image: AssetImage(
//                               "assets/images/woman.png",
//                             ),
//                             fit: BoxFit.cover,
//                           )),
//                       const Text(
//                         "Women",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       )
//                     ]),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 70,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: Color(0xffd4af37),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       BoxShadow(
//                         blurRadius: 2,
//                         color: Color(0xffc98ca7),
//                       ),
//                     ]),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           height: 70,
//                           width: 55,
//                           child: const Image(
//                             image: AssetImage(
//                               "assets/images/kid.png",
//                             ),
//                             fit: BoxFit.fill,
//                           )),
//                       const Text(
//                         "Kids",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       )
//                     ]),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 height: 70,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     color: const Color(0xffd4af37),
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       BoxShadow(
//                         blurRadius: 2,
//                         color: Color(0xffc98ca7),
//                       ),
//                     ]),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(
//                           height: 70,
//                           width: 70,
//                           child: const Image(
//                             image: AssetImage(
//                               "assets/images/sale.png",
//                             ),
//                             fit: BoxFit.cover,
//                           )),
//                       const Text(
//                         "Sale",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600),
//                       )
//                     ]),
//               )
//             ],
//           ),
//         ));
//   }
// }










        // ListView.builder(
        // itemCount: category.length,
        // itemBuilder: (context, index) {
        //   return Padding(
        //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        //     child: Stack(children: [
        //       Container(
        //         height: 70,
        //         width: double.infinity,
        //         decoration:  BoxDecoration(
        //             color: Color(0xffc98ca7).withOpacity(0.9),
        //             borderRadius: BorderRadius.circular(20),
        //             boxShadow:  const [
        //               BoxShadow(
        //                 blurRadius: 2,
        //                 color: Color(0xff991e66),
        //               ),

        //             ]),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 Container(
        //                   height: 60 ,
        //                   width: 60,
        //                   color: Colors.white,

        //                 ),
        //                 Text(category[index],style: const TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 20,
        //                   fontWeight: FontWeight.w600
        //                 ),)
        //               ],
        //             ),
        //       ),
        //     ]),
        //   );
        // })

