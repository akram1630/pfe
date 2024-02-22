import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/styles/colors.dart';

class  editProfile extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    name.text = 'akram' ;
    lastName.text = 'boutoutaou' ;
    email.text = 'akram@gmail.com' ;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: HexColor(defaultGreen),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 44,
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: name,
              decoration: InputDecoration(

                prefix: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10
                  ),
                  child: Icon(Icons.person_outline),
                ),
                  border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: lastName,
              decoration: InputDecoration(
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10
                  ),
                  child: Icon(Icons.people_outline),
                ),
                  border: UnderlineInputBorder(),

              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                prefix: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10
                  ),
                  child: Icon(Icons.email_outlined),
                ),
                  border: UnderlineInputBorder(),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
