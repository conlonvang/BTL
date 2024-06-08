// import 'package:btl_flutter/auth.dart';
// import 'package:btl_flutter/sign_up.dart';
// import 'package:btl_flutter/trang_chu.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';

// class DangNhapPage extends StatefulWidget {
//   const DangNhapPage({super.key});

//   @override
//   State<DangNhapPage> createState() => _DangNhapPageState();
// }

// class _DangNhapPageState extends State<DangNhapPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//     return Scaffold(
//       appBar: AppBar(title: Text('dang nhap')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               keyboardType: TextInputType.emailAddress,
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Please Enter Password";
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               keyboardType: TextInputType.visiblePassword,
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return "Please Enter Email";
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 1.5,
//               height: 55,
//               child: ElevatedButton(
//                 child: Text(
//                   'Dang nhap',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 onPressed: () async {
//                   try {
//                     await authProvider.signIn(_emailController.text, _passController.text);
//                      Fluttertoast.showToast(msg: " Dang nhap thanh cong");
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TrangChuPage(),
//                         ));
//                   } catch (e) {
//                     print(e);
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
//               ),
//             ),
//                  SizedBox(
//               height: 20,
//             ),
//             Text('Or'),
//                  SizedBox(
//               height: 20,
//             ),
//             TextButton(onPressed: (){
//               Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DangKyPage(),
//                         ));
//             },
//             child:Text('Tao tai khoan', style: TextStyle( color: Colors.blue),) ,)
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:btl_flutter/auth.dart';
import 'package:btl_flutter/sign_up.dart';
import 'package:btl_flutter/trang_chu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DangNhapPage extends StatefulWidget {
  const DangNhapPage({super.key});

  @override
  State<DangNhapPage> createState() => _DangNhapPageState();
}

class _DangNhapPageState extends State<DangNhapPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Đăng nhập')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: 55,
              child: ElevatedButton(
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () async {
                  try {
                    await authProvider.signIn(_emailController.text, _passController.text);
                    Fluttertoast.showToast(msg: "Đăng nhập thành công");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrangChuPage(),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue, foregroundColor: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text('Or'),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DangKyPage(),
                  ),
                );
              },
              child: Text(
                'Tạo tài khoản',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
