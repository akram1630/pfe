import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';

Widget defaultButton(
        {double radius = 0,
        double width = double.infinity,
        Color ? color,
        double ? textSize ,
        Color ? textColor ,
        required void function(),
        required String text,
        bool isUppercase = true}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
      color: color ?? HexColor(defaultGreen),
      borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: GoogleFonts.poppins(
            fontSize: textSize ?? 22,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold
          )
      // TextStyle(color: textColor ?? Colors.white, ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    )
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
context, //// we can't return the previous screen when we click back
MaterialPageRoute(
// and it will get u out of the app (quitter)
builder: (context) => widget,
),
(route) => false // we shoud put false to not return
);
