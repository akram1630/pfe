import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/layout/cubit/states.dart';
import 'package:pfe/layout/layout.dart';
import 'package:pfe/modules/settings/settings_screen.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

import '../../shared/cache_helper.dart';
import '../../shared/constants.dart';
import '../login/loginScreen.dart';

class  editProfile extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<pfeCubit,pfeStates>(
      listener: (context,state){
        if(state is pfeUpdateUserSuccessState)
          myShowDialog(context: context, nbrButtons: 1, message: 'updated success', btn1: 'Done', bt1Pressed: (){Navigator.pop(context);}, colorMessage: Colors.black, colorBtn1: HexColor(defaultGreen),bt2Pressed: (){});
        if(state is pfeUpdateUserErrorState)
          myShowDialog(context: context, nbrButtons: 1, message: 'updated failed', btn1: 'exit', bt1Pressed: (){Navigator.pop(context);}, colorMessage: Colors.black, colorBtn1: Colors.red,bt2Pressed: (){});

      },
      builder:(context,state){
        pfeCubit cubit = pfeCubit.get(context);
        //cubit.getUser(token); looop
        if(cubit.user != null){
          name.text = cubit.user!.first_name! ;
          lastName.text = cubit.user!.last_name! ;
          email.text = cubit.user!.email! ;
          phone.text = cubit.user!.phone_number! ;
        }
        else
          cubit.getUser(token);
        return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/Dalti_Logo.jpg')
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    myTextForm(icon: Icon(Icons.person,color: HexColor(defaultGreen)) ,label: "first name" , controller: name, ),
                    SizedBox(height: 20,),
                    myTextForm(icon: Icon(Icons.person,color: HexColor(defaultGreen)) ,label: "first name" , controller: lastName, ),
                    SizedBox(height: 20,),
                    myTextForm(icon: Icon(Icons.mail_outline_outlined,color: HexColor(defaultGreen)) ,label: "email" , controller: email, numOfForm: 2 ),
                    SizedBox(height: 20,),
                    myTextForm(icon: Icon(Icons.phone,color: HexColor(defaultGreen)) ,label: "phone" , controller: phone, ),
                    SizedBox(height: 20,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 65),
                      child: defaultButton(
                          function: (){
                            cubit.updateUser(
                              email: email.text,
                              first_name: name.text,
                              last_name: lastName.text,
                              phone_number: phone.text
                            );
                          },

                          text: 'Update',
                          textSize: 25,
                          textColor: Colors.white,
                        color: HexColor(defaultGreen),
                        radius: 10
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 65),
                      child: defaultButton(function: () {
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
                        radius: 10,
                        textSize: 22,
                        textColor: Colors.white,
                        text:'Log-out',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
      } ,
    );
  }
}


// appBar: AppBar(
//   leading: IconButton(
//     onPressed: (){
//       cubit.startBackgroundTask();
//       navigateAndFinish(context, layout(cubit.user!.first_name!));
//     },
//     icon: Icon(Icons.arrow_back),
//   ),
// ),