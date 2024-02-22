import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/modules/edit_profile/editProfile.dart';
import 'package:pfe/modules/login/loginScreen.dart';
import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

class settingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Card(
              child: Column(
                children: [
                  InkWell(
                      onTap: (){
                        navigateTo(context, editProfile());
                      },
                      child: Row(
                        children: [
                          Icon(Icons.account_box_outlined),
                          SizedBox(width: 20,),
                          Expanded(
                              child: Text('Edit Profile')
                          ),
                          Expanded(
                              child: Text('Edit Profile',style: TextStyle(
                                fontFamily: 'Poppins'
                              ),)
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.sunny),
                          SizedBox(width: 20,),
                          Expanded(
                              child: Text('Appearence')
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.language),
                          SizedBox(width: 20,),
                          Expanded(
                              child: Text('Language')
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){},
                      child: Row(
                        children: [
                          Icon(Icons.notifications_none_outlined),
                          SizedBox(width: 20,),
                          Expanded(
                              child: Text('Notification')
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            MaterialButton(
              onPressed: (){
                cachHelper.removeData(key: 'token').then((value){
                  navigateAndFinish(context, loginScreen());
                });
              },
              child: Container(
                padding: EdgeInsets.all(10) ,
                color: HexColor(defaultGreen),
                  child: Text('LogOut')
              ),
            )
          ],
        ),
      ),
    );
  }
}
