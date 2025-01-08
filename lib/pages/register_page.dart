import 'package:doan_bandoannhanh/components/my_button.dart';
import 'package:flutter/material.dart';

import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
    final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();

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
          //thông báo 
          Text(
            "Tạo tài khoản ",
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
          //mật khâu 
          MyTextField(
            controller: passwordController,
            hintText: "Mật Khẩu",
            obscureText: true,
          ),

          const SizedBox(height: 25),

          //nhập lại mật khẩu 
          MyTextField(
            controller: passwordController,
            hintText: "Nhập lại mật khẩu",
            obscureText: true,
          ),

          const SizedBox(height: 25),
          //nút đăng kí 
          MyButton(
            text:"Đăng kí", onTap: () {},
            ),

          const SizedBox(height: 25),
          //đăng nhập
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Đăng Nhập",
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