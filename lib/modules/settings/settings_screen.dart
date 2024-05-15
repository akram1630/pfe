import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/modules/edit_profile/editProfile.dart';
import 'package:pfe/modules/info/infoScreen.dart';
import 'package:pfe/modules/login/loginScreen.dart';
import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';

class settingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<pfeCubit,pfeStates>(
        listener: (context,state){},
        builder:(context,state){
          pfeCubit cubit = pfeCubit.get(context);
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    SizedBox(height: 20,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 10,
                      color: HexColor("#CCCCCC"),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            itemTitle(onTap:(){
                              Timer(Duration(seconds: 1), () => cubit.stopBackgroundTask());
                              navigateAndFinish(context, editProfile());
                            } , icon: Icons.account_box_outlined, text: 'Edit Profile')
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    defaultButton(function: () {
                      myShowDialog(
                          context: context,
                          nbrButtons: 2,
                          message: 'confirme Logout',
                          btn1: 'yes',
                          bt2Pressed: (){

                            Navigator.of(context).pop();
                          },
                          btn2: 'no',
                          colorBtn2: Colors.red[400],
                          bt1Pressed: () async {
                            await cachHelper.removeData(key: 'token').then((value){
                              Timer(Duration(seconds: 1), () => cubit.stopBackgroundTask());
                              navigateAndFinish(context, loginScreen());
                            });
                          },
                          colorBtn1: Colors.green
                      );

                      },
                      width: 150,
                      radius: 10,
                      textSize: 22,
                      textColor: Colors.white,
                      text:'Log-out',

                    ),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
Widget itemTitle ({
  required void Function()? onTap,
  required IconData  icon,
  required String text,
}){
  return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 20,),
            Expanded(
                child: myText(text: text)
            ),
          ],
        ),
      )
  );
}

/*IconButton(
                      onPressed: (){

                        navigateTo(context, infoScreen());
                      },
                      icon: Icon(Icons.info_outline_rounded)
                  ),*/