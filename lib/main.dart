import 'package:application_assignment/pages/homepage.dart';
import 'package:application_assignment/pages/homepage2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StartScreen(),
  ));
}

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool go = false;
  checkToken() async {
    Future.delayed(const Duration(seconds: 3));
    SharedPreferences.setMockInitialValues({});
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? token = prefs.getBool("login");
    if (token == true) {
      go = true;
    }

    // if (token == null) {
    //   await prefs.setBool("signIn", false);
    //   await prefs.setString("lang", "english");
    // } else {
    //   setState(() {
    //     go = true;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkToken(),
          builder: ((context, snapshot) {
            if (go == true) {
              return const HomePage2();
            } else {
              return const HomePage();
            }
          })),
    );
  }
}

//------------
