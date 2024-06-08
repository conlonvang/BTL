// import 'dart:io';

// import 'package:btl_flutter/login.dart';
// import 'package:btl_flutter/trang_chu.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:btl_flutter/auth.dart';

// class DangKyPage extends StatefulWidget {
//   const DangKyPage({super.key});

//   @override
//   State<DangKyPage> createState() => _DangKyPageState();
// }

// class _DangKyPageState extends State<DangKyPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();

//   File? _image;
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//   final _storage = FirebaseStorage.instance;

//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }

//   Future<String> _uploadImage(File image) async {
//     final ref = _storage.ref().child('user_images').child('${_auth.currentUser!.uid}.jpg');

//     await ref.putFile(image);
//     return await ref.getDownloadURL();
//   }

//   Future<void> _signUp() async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text);

//       final imageUrl = await _uploadImage(_image!);
//       await _firestore.collection('user').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'email': _emailController.text,
//         'name': _nameController.text,
//         'imageUrl': imageUrl
//       });

//       Fluttertoast.showToast(msg: " tao thanh cong");

//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TrangChuPage(),
//           ));
//     } catch (e) {
//       print(e);
//     }
//   }

//   Widget build(BuildContext context) {
//     // final authProvider = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('dang ky')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               InkWell(
//                 onTap: _pickImage,
//                 child: Container(
//                   height: 200,
//                   width: 200,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(),
//                   ),
//                   child: _image == null
//                       ? Center(
//                           child: Icon(
//                             Icons.camera_alt_rounded,
//                             size: 50,
//                           ),
//                         )
//                       : ClipRRect(
//                           borderRadius: BorderRadius.circular(100),
//                           child: Image.file(
//                             _image!,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.name,
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Ten',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please Enter Ten";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please Enter Email";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.visiblePassword,
//                 controller: _passController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please Enter Password";
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width / 1.5,
//                 height: 55,
//                 child: ElevatedButton(
//                   child: Text(
//                     'Dang ky',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   onPressed: _signUp,
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text('Or'),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DangNhapPage(),
//                       ));
//                 },
//                 child: Text(
//                   'Quay lai dang nhap',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:btl_flutter/login.dart';
import 'package:btl_flutter/trang_chu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class DangKyPage extends StatefulWidget {
  const DangKyPage({super.key});

  @override
  State<DangKyPage> createState() => _DangKyPageState();
}

class _DangKyPageState extends State<DangKyPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  File? _image;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<String> _uploadImage(File image) async {
    final ref = _storage.ref().child('user_images').child('${_auth.currentUser!.uid}.jpg');

    await ref.putFile(image);
    return await ref.getDownloadURL();
  }

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text);

      final imageUrl = await _uploadImage(_image!);
      await _firestore.collection('user').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': _emailController.text,
        'name': _nameController.text,
        'imageUrl': imageUrl
      });

      Fluttertoast.showToast(msg: "Tạo tài khoản thành công");

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TrangChuPage(),
          ));
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "Đăng ký thành công");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng ký')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(),
                  ),
                  child: _image == null
                      ? Center(
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 50,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Tên',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Tên";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: _passController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 55,
                child: ElevatedButton(
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    _signUp();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Text('Or'),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DangNhapPage(),
                      ));
                },
                child: Text(
                  'Quay lại đăng nhập',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
