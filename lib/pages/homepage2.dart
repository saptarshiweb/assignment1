// ignore_for_file: invalid_use_of_visible_for_testing_member

import "dart:convert";

import "package:application_assignment/colors.dart";
import "package:application_assignment/helper_function.dart";
import "package:application_assignment/pages/language_selection_page.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  List im = [];
  List eng = [];
  String auth_val = "316|En30fCNgf7vUBX99C529uJvYI9Tqmz03EzrWz3v897623a0c";

  String langval = "";
  getTasks() async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? lang = prefs.getString("lang");
    langval = lang ?? "english";
    final response = await http.get(
      Uri.parse("https://kv.businessenquiry.co.in/api/category"),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE',
        'Authorization': 'Bearer $auth_val'
      },
    );
    var responseval = json.decode(response.body);
    print(langval);
    var val = responseval['data'];

    setState(() {
      eng = [];
    });

    val.forEach((element) {
      if (langval == "english") {
        eng.add(element['category'].toString());
      } else if (langval == "hindi")
        eng.add(element['ln_hn'].toString());
      else
        eng.add(element['ln_bn'].toString());
      im.add(element['icon']);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: write("Home Page", Colors.black, 22, true),
      ),
      body: FutureBuilder(
        future: getTasks(),
        builder: (context, snapshot) {
          if (eng.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ebutton(
                      fun: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LanguageSelection()));
                      },
                      text: "Change Language"),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: eng.length,
                          itemBuilder: (context, index) {
                            final r = eng[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                                child: Row(
                                  children: [
                                    Image.network(
                                      im[index],
                                      height: 50,
                                      width: 50,
                                    ),
                                    const SizedBox(width: 20),
                                    write(eng[index], Colors.black, 24, true),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
