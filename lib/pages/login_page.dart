// ignore_for_file: use_build_context_synchronously

import 'package:doan_bandoannhanh/components/my_button.dart';
import 'package:doan_bandoannhanh/components/my_textfield.dart';
import 'package:doan_bandoannhanh/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  // đăng nhập
  void login() async {

    final _authService = AuthService();

    // Kiểm tra dữ liệu
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Thông báo"),
          content: Text("Vui lòng nhập đầy đủ email và mật khẩu."),
        ),
      );
      return;
    }
    try {
      await _authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }    
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Lỗi"),
          content: Text(e.toString()),
        ),
      );
    }
  }

  void forgotPw() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("QQuên mật khẩu"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),
            //TitleApp
            Text(
              "Đồ ăn nhanh",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),
            //email
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 25),
            //mật khẩu
            MyTextField(
              controller: passwordController,
              hintText: "Mật Khẩu",
              obscureText: true,
            ),

            const SizedBox(height: 25),
          //nút đăng nhập
            MyButton(
              text:"Đăng nhập", 
              onTap: login,
            ),

            const SizedBox(height: 25),
            //register
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Đăng Kí ngay",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
