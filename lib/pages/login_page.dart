import 'package:doan_bandoannhanh/components/my_button.dart';
import 'package:doan_bandoannhanh/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();
  final TextEditingController confirmPasswordController =TextEditingController();


  // login
  void login(){


    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
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
          //message
          Text(
            "Gif do",
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
          //password
          MyTextField(
            controller: passwordController,
            hintText: "Mật Khẩu",
            obscureText: true,
          ),

          const SizedBox(height: 25),
          //sign button
          MyButton(
            text:"Sign In", onTap: login,
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