import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';

Widget defaultButton({
        double radius = 0,
        double width = double.infinity,
        Color? color,
        double? textSize,
        Color? textColor = Colors.white,
        required void function(),
        required String text,
        bool isUppercase = true
    }) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: color ?? HexColor(defaultGreen),
          borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: myText(text: text, isBold: true,color: textColor,size: textSize)
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, //// we can't return the previous screen when we click back
    MaterialPageRoute(
// and it will get u out of the app (quitter)
      builder: (context) => widget,
    ),
    (route) => false // we shoud put false to not return
    );

Text myText({
    BuildContext ? context ,
    required String text,
    bool isBold = true,
    double? size,
    Color? color,
    int maxLines = 1,
    bool? alignRight
    }) {
  return Text(
    text,
    // we must wrap with Container(width:) or Expended to turn on OverFlow
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,//alignRight != null ? TextAlign.right : null,
    maxLines: maxLines,
    style: context != null ? Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(
        fontSize: size, color: color
      ) : TextStyle(
        color: color != null ? color : Colors.black,
        fontSize: size != null ? size : 25,
        fontWeight: isBold ? FontWeight.bold : null,
      ),
  );
}

bool isValidString(String input) {
  if (input.length < 8) {
    return false;
  }
  bool hasUpperCase = input.contains(new RegExp(r'[A-Z]'));
  bool hasNumber = input.contains(new RegExp(r'\d'));

  return hasUpperCase && hasNumber;
}

bool isValidEmail(String email) {
// Check if the email contains '@' and ends with '.com'
  return email.contains('@') && email.endsWith('.com');
}

Container myTextForm(
    {required String label,
    Icon? icon,
    double? height,
    double? width,
    TextEditingController? controller,
    Color? color,
    int numOfForm = 0,
    bool obscureText = false,
    void Function()? prefixPressed}) {
  return Container(
    color: Colors.black.withOpacity(0.055),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
        /* if (numOfForm == 1) //password
        if (value!.isEmpty || !isValidString(value))
          return 'password should have numbers & majuscule';
        if (numOfForm == 2) //Email
        if (value!.isEmpty || !isValidEmail(value))
          return 'please enter a valide email address';*/
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: icon,
        suffix: numOfForm == 1
            ? IconButton(
                icon: Icon(obscureText
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined),
                onPressed: prefixPressed,
              )
            : null,
        border: OutlineInputBorder(),
        label: Text(label),
      ),
    ),
  );
}

Future myShowDialog({
  required BuildContext context,
  required int nbrButtons,
  required String message,
  required String btn1,
  String? btn2,
  required void bt1Pressed(),
  required void bt2Pressed(),
  Color colorMessage = Colors.black,
  required Color colorBtn1,
  Color? colorBtn2,
}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actions: [
              if(btn2 != null)
                defaultButton(function: bt2Pressed , color: colorBtn2, text: btn2,radius: 10,textSize: 18,width: 130),

              defaultButton(function: bt1Pressed , color: colorBtn1,text: btn1,radius: 10,textSize: 18,width: 130),



            ],
            title: Center(
                child: Column(
              children: [
                Text(message),
              ],
            )),
            contentPadding: EdgeInsets.all(8),
          ));
}
