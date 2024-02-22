import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    titleSpacing: 20,
    color: Colors.white,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
      backwardsCompatibility: false, // lazm false the root to control (statusBar) the screen which show the time and battery ....
      systemOverlayStyle: SystemUiOverlayStyle( //control (statusBar) the screen which show the time and battery...
          statusBarColor: Colors.white,  // background color
          statusBarIconBrightness: Brightness.dark // contenent color time letters ...
      ) ,
      iconTheme: IconThemeData(
          color: Colors.black
      )
  ),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.poppins(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic
    )
  ),
  /*******************************/
  scaffoldBackgroundColor: Colors.white,

);