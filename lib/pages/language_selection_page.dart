import "package:application_assignment/colors.dart";
import "package:application_assignment/helper_function.dart";
import "package:application_assignment/pages/homepage2.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: write("Select Language", Colors.black, 22, true),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            ebutton(
                fun: () async {
                  // SharedPreferences.setMockInitialValues({});
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("lang", "english");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage2()));
                },
                text: "English"),
            const SizedBox(height: 10),
            ebutton(
                fun: () async {
                  // SharedPreferences.setMockInitialValues({});
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("lang", "hindi");

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage2()));
                },
                text: "Hindi"),
            const SizedBox(height: 10),
            ebutton(
                fun: () async {
                  // SharedPreferences.setMockInitialValues({});
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString("lang", "bengali");
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage2()));
                },
                text: "Bengali"),
          ],
        ),
      ),
    );
  }
}
