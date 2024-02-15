import "package:application_assignment/colors.dart";
import "package:application_assignment/helper_function.dart";
import "package:application_assignment/pages/language_selection_page.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: write("Login/Logout", Colors.black, 22, true),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Column(
          children: [
            numfield1(
              controller: phoneController,
              label: "Enter your Phone Number : ",
              mlength: 10,
              
            ),
            const SizedBox(height: 20),
            tfield1(
                controller: passwordController,
                label: "Enter your Password :",
                obscuretext: true),
            const SizedBox(height: 20),
            ebutton(
                fun: () async {
                  SharedPreferences.setMockInitialValues({});
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool("signIn", true);
                  final bool? token = prefs.getBool("login");
                  

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LanguageSelection()));
                },
                text: "Login"),
          ],
        ),
      ),
    );
  }
}
