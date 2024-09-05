// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart';

// class ImageUploads extends StatefulWidget {
//   ImageUploads({Key? key}) : super(key: key);

//   @override
//   _ImageUploadsState createState() => _ImageUploadsState();
// }

// class _ImageUploadsState extends State<ImageUploads> {
//   firebase_storage.FirebaseStorage storage =
//       firebase_storage.FirebaseStorage.instance;

//   File? _photo;
//   final ImagePicker _picker = ImagePicker();

//   Future imgFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future imgFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);

//     setState(() {
//       if (pickedFile != null) {
//         _photo = File(pickedFile.path);
//         uploadFile();
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future uploadFile() async {
//     if (_photo == null) return;
//     final fileName = basename(_photo!.path);
//     final destination = 'files/$fileName';

//     try {
//       final ref = firebase_storage.FirebaseStorage.instance
//           .ref(destination)
//           .child('file/');
//       await ref.putFile(_photo!);
//     } catch (e) {
//       print('error occured');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 32,
//           ),
//           Center(
//             child: GestureDetector(
//               onTap: () {
//                 _showPicker(context);
//               },
//               child: CircleAvatar(
//                 radius: 55,
//                 backgroundColor: Color(0xffFDCF09),
//                 child: _photo != null
//                     ? ClipRRect(
//                         borderRadius: BorderRadius.circular(50),
//                         child: Image.file(
//                           _photo!,
//                           width: 100,
//                           height: 100,
//                           fit: BoxFit.fitHeight,
//                         ),
//                       )
//                     : Container(
//                         decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(50)),
//                         width: 100,
//                         height: 100,
//                         child: Icon(
//                           Icons.camera_alt,
//                           color: Colors.grey[800],
//                         ),
//                       ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   void _showPicker(context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (BuildContext bc) {
//           return SafeArea(
//             child: Container(
//               child: new Wrap(
//                 children: <Widget>[
//                   new ListTile(
//                       leading: new Icon(Icons.photo_library),
//                       title: new Text('Gallery'),
//                       onTap: () {
//                         imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   new ListTile(
//                     leading: new Icon(Icons.photo_camera),
//                     title: new Text('Camera'),
//                     onTap: () {
//                       imgFromCamera();
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }





import 'package:flutter/material.dart';
import 'package:footwear/Activity/Men/Product%20Detail%20Screen.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MenScreen extends StatelessWidget {
  TextEditingController searchcontroller = TextEditingController();

  // List of products to be displayed in the grid
  final List<Map<String, dynamic>> products = [
    
    {
      'name': 'G-GR-Chappal',
      'price': '2999',
      'image': 'assets/images/chapal.png', // Replace with your actual image path
      'rating': 4.5,
    },
    {
      'name': 'G-GR-Sneaker',
      'price': '3999',
      'image': 'assets/images/sneaker.png', // Replace with your actual image path
      'rating': 4.0,
    },
    {
      'name': 'G-GR-Boots',
      'price': '4999',
      'image': 'assets/images/boot.png', // Replace with your actual image path
      'rating': 4.8,
    },
    {
      'name': 'G-GR-Loafers',
      'price': '2999',
      'image': 'assets/images/loafer.png', // Replace with your actual image path
      'rating': 4.3,
    },
        {
      'name': 'G-GR-Loafers',
      'price': '2999',
      'image': 'assets/images/loafer2.png', // Replace with your actual image path
      'rating': 4.3,
    },
        {
      'name': 'G-GR-jogger',
      'price': '2999',
      'image': 'assets/images/shoe.png', // Replace with your actual image path
      'rating': 4.3,
    },
    // Add more products as needed
  ];

  MenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(
          0xff991e66,
        ),
        title: Text("Men",
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
      body: Column(
        children: [
          Container(
            height: 70,
            color: const Color(
              0xff991e66,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextFormField(
                controller: searchcontroller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  hintText: "Search",
                  hintStyle: const TextStyle(color: Color(0xff426b69)),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                    borderSide: BorderSide.none, // No border
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${products.length} Products', // Dynamically display the number of products
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 2 columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: products.length, // Number of items to display
              itemBuilder: (context, index) {
                return ProductCard(
                  name: products[index]['name'],
                  price: products[index]['price'],
                  image: products[index]['image'],
                  rating: products[index]['rating'],
                );
              },
            ),
          ),
        ],
      ),
      
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final double rating;

  ProductCard({
    required this.name,
    required this.price,
    required this.image,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductDetailScreen(
          image: image, 
          name: name, 
          price: price, 
          rating: rating,)));
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey.withOpacity(0.3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14,color:  Colors.black87),
                    ),
                          Text(
                            'Rs: $price',
                            style: const TextStyle(color:  Colors.black87, fontSize: 12),
                          ),
                          Row(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                color: Colors.yellow[700],
                                size: 14,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// class ProductCard extends StatefulWidget {
//   final String name;
//   final String price;
//   final String image;
//   final double rating;

//   ProductCard({
//     required this.name,
//     required this.price,
//     required this.image,
//     required this.rating,
//   });

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   String? _uploadedImageUrl;

// Future<void> _pickAndUploadImage() async {
//   try {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final storageRef = FirebaseStorage.instance.ref().child('products/${widget.name}.jpg');
//       await storageRef.putFile(File(pickedFile.path));
//       final downloadUrl = await storageRef.getDownloadURL();

//       setState(() {
//         _uploadedImageUrl = downloadUrl;
//       });

//       await FirebaseFirestore.instance.collection('products').doc(widget.name).set({
//         'name': widget.name,
//         'price': widget.price,
//         'image': downloadUrl,
//         'rating': widget.rating,
//       }, SetOptions(merge: true));

//       print("Image uploaded successfully");
//     } else {
//       print("No image selected");
//     }
//   } catch (e) {
//     print("Error uploading image: $e");
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _pickAndUploadImage,
//       child: Card(
//         elevation: 8,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Container(
//                 height: 140,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   image: DecorationImage(
//                     image: _uploadedImageUrl != null ? NetworkImage(_uploadedImageUrl!) : AssetImage(widget.image) as ImageProvider,
//                     fit: BoxFit.fitHeight,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               color: Colors.grey.shade300,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       widget.name,
//                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//                     ),
//                     Text(
//                       'Rs: ${widget.price}',
//                       style: const TextStyle(color: Colors.black87, fontSize: 12),
//                     ),
//                     Row(
//                       children: List.generate(
//                         5,
//                         (index) => Icon(
//                           index < widget.rating ? Icons.star : Icons.star_border,
//                           color: Colors.yellow[700],
//                           size: 14,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// ---------------------------------------





