import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/app.dart';
//import 'package:instagram/features/authentication/presentation/pages/auth_page.dart';
//import 'package:instagram/features/authentication/presentation/pages/login_page.dart';
import 'package:instagram/firebase_options.dart';
//import 'package:instagram/themes/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
