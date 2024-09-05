import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart';

class ImageUploads extends StatefulWidget {
  final String name;
  final String email;

  ImageUploads({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  @override
  _ImageUploadsState createState() => _ImageUploadsState();
}

class _ImageUploadsState extends State<ImageUploads> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80, // Adjust quality if needed
    );

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future imgFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80, // Adjust quality if needed
    );

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
        uploadFile();
      } else {
        print('No image selected.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = firebase_storage.FirebaseStorage.instance
          .ref(destination)
          .child('file/');
      await ref.putFile(_photo!);
    } catch (e) {
      print('error occurred');
    }
  }

  void _deleteImage() {
    setState(() {
      _photo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context);
              },
              child: Container(
                width: 110, // Width of the container
                height: 110, // Height of the container
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFDCF09),
                ),
                child: _photo != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(55),
                        child: Image.file(
                          _photo!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Name: ${widget.name}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Email: ${widget.email}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: imgFromCamera,
            child: Text('Take Photo'),
          ),
          ElevatedButton(
            onPressed: imgFromGallery,
            child: Text('Pick from Gallery'),
          ),
          if (_photo != null) // Show delete button only if an image is selected
            ElevatedButton(
              onPressed: _deleteImage,
              child: Text('Delete Photo'),
            ),
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                child: Text('Take a photo'),
                onPressed: () {
                  imgFromCamera();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Select from gallery'),
                onPressed: () {
                  imgFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
















// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:path/path.dart';

// class ImageUploads extends StatefulWidget {
//   final String name;
//   final String email;

//   ImageUploads({
//     Key? key,
//     required this.name,
//     required this.email,
//   }) : super(key: key);

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
//       print('error occurred');
//     }
//   }

//   void _deleteImage() {
//     setState(() {
//       _photo = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Column(
//         children: <Widget>[
//           SizedBox(height: 20),
//           Center(
//             child: Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     _showPicker(context);
//                   },
//                   child: CircleAvatar(
//                     radius: 55,
//                     backgroundColor: Color(0xffFDCF09),
//                     child: _photo != null
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child: Image.file(
//                               _photo!,
//                               width: double.infinity,
//                               height: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                           )
//                         : Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             width: 100,
//                             height: 100,
//                             child: Icon(
//                               Icons.camera_alt,
//                               color: Colors.grey[800],
//                             ),
//                           ),
//                   ),
//                 ),
//                 if (_photo != null)
//                   IconButton(
//                     icon: Icon(Icons.delete, color: Colors.red),
//                     onPressed: _deleteImage,
//                   ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Name: ${widget.name}',
//             style: TextStyle(fontSize: 18),
//           ),
//           Text(
//             'Email: ${widget.email}',
//             style: TextStyle(fontSize: 18),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: imgFromCamera,
//             child: Text('Take Photo'),
//           ),
//           ElevatedButton(
//             onPressed: imgFromGallery,
//             child: Text('Pick from Gallery'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showPicker(context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Column(
//             children: <Widget>[
//               TextButton(
//                 child: Text('Take a photo'),
//                 onPressed: () {
//                   imgFromCamera();
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text('Select from gallery'),
//                 onPressed: () {
//                   imgFromGallery();
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text('Cancel'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }






// =========================
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
//       print('error occurred');
//     }
//   }

//   void _deleteImage() {
//     setState(() {
//       _photo = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           SizedBox(height: 32),
//           Center(
//             child: Stack(
//               alignment: Alignment.bottomRight,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     _showPicker(context);
//                   },
//                   child: CircleAvatar(
//                     radius: 55,
//                     backgroundColor: Color(0xffFDCF09),
//                     child: _photo != null
//                         ? ClipRRect(
//                             borderRadius: BorderRadius.circular(50),
//                             child: Image.file(
//                               _photo!,
//                               width: double.infinity,
//                               height: double.infinity,
//                               fit: BoxFit.cover, // Ensure the image covers the CircleAvatar
//                             ),
//                           )
//                         : Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(50),
//                             ),
//                             width: 100,
//                             height: 100,
//                             child: Icon(
//                               Icons.camera_alt,
//                               color: Colors.grey[800],
//                             ),
//                           ),
//                   ),
//                 ),
//                 if (_photo != null)
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: IconButton(
//                       icon: Icon(Icons.delete, color: Colors.red),
//                       onPressed: _deleteImage,
//                     ),
//                   ),
//               ],
//             ),
//           ),
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
//               child: Wrap(
//                 children: <Widget>[
//                   ListTile(
//                       leading: Icon(Icons.photo_library),
//                       title: Text('Gallery'),
//                       onTap: () {
//                         imgFromGallery();
//                         Navigator.of(context).pop();
//                       }),
//                   ListTile(
//                     leading: Icon(Icons.photo_camera),
//                     title: Text('Camera'),
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









// -------------------------




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
//                           width: double.infinity,
//                           height: double.infinity,
//                           fit: BoxFit.fill,
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

