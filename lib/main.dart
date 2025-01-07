import 'package:doan_bandoannhanh/firebase_options.dart';
import 'package:doan_bandoannhanh/models/restaurant.dart';
import 'package:doan_bandoannhanh/services/auth/auth_gate.dart';
import 'package:doan_bandoannhanh/themes/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;
void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);


  runApp(
   MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      
      ChangeNotifierProvider(create: (context) => Restaurant()),
      
    ],
    child: const MyApp(),
   ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthGate(
      ),
      theme:  Provider.of<ThemeProvider>(context).themeData,
    );
  }
}