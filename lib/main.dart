import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/firebase_options.dart';
import 'package:sample_project/update.dart';
import 'home.dart';
import 'add.dart';
import 'update.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Demo',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddUser(),
        '/update':(context) => const UpdateDonor(),
      },
      initialRoute: '/',
    );
  }
}
