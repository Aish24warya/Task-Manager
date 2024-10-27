import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taskmanage/login.dart';
import 'firebase_options.dart';

void main()async{
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage(),
      
    );
  }
}