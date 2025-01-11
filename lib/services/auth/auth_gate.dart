import 'package:doan_bandoannhanh/pages/home_page.dart';
import 'package:doan_bandoannhanh/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          //người dùng đã đăng nhập
          if(snapshot.hasData){
            return const HomePage();
          }

          // người dùng chưa đăng nhập
          else{
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}