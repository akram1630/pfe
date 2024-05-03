import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData myLightMode = ThemeData(
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
        //fontStyle: FontStyle.italic
    )
  ),
  /*******************************/
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: HexColor(defaultGreen)),
    )  ,
    border: UnderlineInputBorder(),

  ),
    canvasColor: Colors.black // for iconNav
);
ThemeData myDarkMode = ThemeData(
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    centerTitle: true,
    titleSpacing: 20,
    color: HexColor('#202124'),
      titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
      backwardsCompatibility: false, // lazm false the root to control (statusBar) the screen which show the time and battery ....
      systemOverlayStyle: SystemUiOverlayStyle( //control (statusBar) the screen which show the time and battery...
          statusBarColor: HexColor('#202124'),  // background color
          statusBarIconBrightness: Brightness.light // contenent color time letters ...
      ) ,
      iconTheme: IconThemeData(
          color: Colors.white
      )
  ),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        //fontStyle: FontStyle.italic
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: HexColor(defaultGreen)),
    )  ,
    border: UnderlineInputBorder(),

  ),
  /*******************************/
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black
  ),

  scaffoldBackgroundColor: HexColor('#202124'),
  canvasColor: Colors.white // for iconNav
);