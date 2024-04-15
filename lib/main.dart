import 'package:contractus/screen/client%20screen/client%20home/client_home.dart';
import 'package:contractus/screen/splash%20screen/mt_splash_screen.dart';
import 'package:contractus/screen/welcome%20screen/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contract Us',
      theme: ThemeData(fontFamily: 'Display'),
      home: ClientHome(signedin: false,),
      // const SplashScreen(),
    );
  }
}
