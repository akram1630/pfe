import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/shared/constants.dart';
import 'package:pfe/styles/colors.dart';

import '../../layout/cubit/states.dart';
import '../login/loginScreen.dart';

class homeScreen extends StatelessWidget {

  homeScreen(){}
  TextStyle ? myStyle ;
  homeScreen.withStyle({this.myStyle});
  //i did consructor to active dark-mode

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<pfeCubit, pfeStates>(
        listener: (context, state) {
          if(state is pfeRegisterDateSuccessState)
            myShowDialog(
              context: context,
              nbrButtons: 1,
              message: 'registration done',
              btn1: 'Ok',
              bt1Pressed: (){Navigator.of(context).pop();},
              bt2Pressed: (){},
              colorBtn1: Colors.green,
            );
          if(state is pfeRegisterDateErrorState)
            myShowDialog(
              context: context,
              nbrButtons: 1,
              message: 'registration failed',
              btn1: 'Ok',
              bt1Pressed: (){Navigator.of(context).pop();},
              bt2Pressed: (){},
              colorBtn1: Colors.red,
            );
        },
        builder: (context, state) {
          pfeCubit cubit = pfeCubit.get(context);
          return Scaffold(
            body : SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myText(text: 'Discover our ', isBold: true,context: context,size: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        myText(text: 'Latest', isBold: true,context: context,size: 30),
                        myText(text: ' Services', isBold: true,context: context,color: HexColor(defaultGreen),size: 32),

                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: myTextForm(label: 'search'),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                              color: HexColor(defaultGreen),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: IconButton(
                            onPressed: (){
                              cubit.getAllServices();
                              cubit.getCategories();
                            },
                            icon: Icon(Icons.search_outlined , size:29,color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    if(cubit.categories != null)
                    Container(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index) => TextButton(
                            onPressed: () { },
                            child: Card(
                              elevation: 10,
                              child: myText(text: cubit.categories!.data[index].category!, isBold: true)
                            ),
                          ) ,
                          separatorBuilder: (context , index) =>SizedBox(width: 10,),
                          itemCount: cubit.categories!.data.length
                      ),
                    )
                    else
                      Center(child: CircularProgressIndicator()),
                    SizedBox(height: 10,),
                    if(cubit.all_services != null)
                    Container(
                      height: 500,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context , index) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 10,
                            color: HexColor("#CCCCCC"),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white, // Choose your border color
                                        width: 2.0, // Choose your border width
                                      ),
                                      borderRadius: BorderRadius.circular(10.0), // Adjust the radius for rounded corners
                                    ),
                                    child: Image.asset(
                                      'assets/images/rain.jpg',
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      myText(text: cubit.all_services!.services[index].Service_name!, isBold: true),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          defaultButton(function: (){
                                            myShowDialog(context: context, nbrButtons: 2, message: 'Confirme Reservation', btn1: 'Reserver', bt1Pressed: (){
                                              cubit.registerDate(
                                                  token: 'Bearer $token',
                                                  serv_id: cubit.all_services!.services[index].Service_name
                                              );
                                              Navigator.of(context).pop();
                                            }, btn2: 'Annuler',colorBtn2: Colors.red[400],
                                                bt2Pressed: (){
                                              Navigator.of(context).pop();
                                            },  colorBtn1: Colors.green);
                                          }, text: 'Reserver',width: 140,textColor: Colors.black,textSize: 20,radius: 10),
                                          SizedBox(width: 10,)
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          separatorBuilder: (context , index) => SizedBox(height: 10,),
                          itemCount: /*cubit.all_services == null ? 2 :*/ cubit.all_services!.services.length
                      ),
                    )
                    else
                      Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
