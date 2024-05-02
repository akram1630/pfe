import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';

Widget defaultButton({
        double radius = 0,
        double width = double.infinity,
        Color? color,
        double? textSize,
        Color? textColor,
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
        child: myText(text: text, isBold: true,color: color)
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
    int? maxLines,
    bool? alignRight
    }) {
  return Text(
    text,
    textAlign: alignRight != null ? TextAlign.right : null,
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
  required void Function()? bt1Pressed,
  void Function()? bt2Pressed,
  required Color colorMessage,
  required Color colorBtn1,
  Color? colorBtn2,
}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            actions: [
              TextButton(
                  onPressed: bt1Pressed,
                  child: myText(text: 'exit', isBold: true,size: 15)
              ),
              if(btn2 != null)
                TextButton(
                  onPressed: bt2Pressed,
                  child: Text(btn2)),
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
