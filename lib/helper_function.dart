import 'package:application_assignment/colors.dart';
import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';

normalNavigation(Widget route, BuildContext context) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => route),
  );
}

easyNavigation(Widget route, BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => route),
      (Route<dynamic> route) => false);
}

Text write(String str, Color c, double size, bool bold) {
  return Text(
    str,
    style: TextStyle(
        color: c,
        fontSize: size,
        fontWeight: (bold) ? FontWeight.bold : FontWeight.normal),
  );
}

ElevatedButton ebutton({required fun, required String text}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      onPressed: () {
        fun();
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            write(text, pColor, 18, true),
          ],
        ),
      ));
}

Widget tfield1(
    {required TextEditingController controller,
    required String label,
    obscuretext = false,mlength=10}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please Enter value";
      }
      return null;
    },
    
    controller: controller,
    obscureText: obscuretext,
    
    style: TextStyle(color: pColor, fontSize: 18, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      hintText: label,
      labelText: label,
      labelStyle:
          TextStyle(color: pColor, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}
Widget numfield1(
    {required TextEditingController controller,
    required String label,
    obscuretext = false,mlength=10}) {
  return TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please Enter value";
      }
      return null;
    },
    keyboardType: TextInputType.number,
    controller: controller,
    obscureText: obscuretext,
    maxLength: mlength,
    
    style: TextStyle(color: pColor, fontSize: 18, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      hintText: label,
      labelText: label,
      labelStyle:
          TextStyle(color: pColor, fontSize: 15, fontWeight: FontWeight.bold),
    ),
  );
}
