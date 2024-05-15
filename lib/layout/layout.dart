import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/layout/cubit/states.dart';
import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/components.dart';

import '../modules/edit_profile/editProfile.dart';
import '../styles/colors.dart';

class layout extends StatelessWidget {
  String ? first_name;
  layout(this.first_name);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<pfeCubit,pfeStates>(
      listener: (context , state){},
      builder: (context , state){
        pfeCubit cubit = pfeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            actions: [
              IconButton(
                  onPressed: () async {
                    cubit.changeThemeMode( await cachHelper.get(key: 'isDarkMode'));
                  },
                  icon: Icon(Icons.nightlight_outlined)
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/Dalti_Logo.jpg')
                    )
                  ),

                ),
              )
            ],
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3 ),
              child: Row(
                children: [
                  Expanded(child: myText(text: 'hello   ', isBold: true,context: context,size: 17)),
                  Expanded(child: myText(size: 17,text: (cubit.user == null || cubit.user!.first_name == null) ? first_name!  : cubit.user!.first_name!, isBold: true,context: context)),
                 // Expanded(child: myText(text: '05/05',size: 12)),
                  Spacer()
                ],
              ),
            ),
          ),
          //body: cubit.bottomScreens[cubit.currentIndex],
          body: WillPopScope(
              onWillPop: () async {return false;},
              child: cubit.bottomScreens[cubit.currentIndex]
          ),
          bottomNavigationBar: Container(
            color: Colors.green,
            height: 85,
            child: CurvedNavigationBar(
              height:55,
              animationDuration: Duration(milliseconds: 250),
              color: Theme.of(context).scaffoldBackgroundColor,//HexColor(defaultGreen),//HexColor('#2e68b2'),
              buttonBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              animationCurve: Curves.easeOutCirc,
              items: <Widget>[
                Column(
                  children: [
                    Icon(Icons.home,   size: 35, color: cubit.greenNavBar[0] ? HexColor(defaultGreen) : Theme.of(context).canvasColor),
                    myText(text: 'Home', isBold: true,color: cubit.greenNavBar[0] ? HexColor(defaultGreen) : Theme.of(context).canvasColor,size: 16)
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.query_builder_rounded, size: 35, color: cubit.greenNavBar[1] ? HexColor(defaultGreen) : Theme.of(context).canvasColor),
                    myText(text: 'Queu', isBold: true,color: cubit.greenNavBar[1] ? HexColor(defaultGreen) : Theme.of(context).canvasColor,size: 16)

                  ],
                ),
                Column(
                    children:[
                      Icon(Icons.settings_outlined, size: 35 , color: cubit.greenNavBar[2] ? HexColor(defaultGreen) : Theme.of(context).canvasColor,),
                      myText(text: 'Settings', isBold: true,color: cubit.greenNavBar[2] ? HexColor(defaultGreen) : Theme.of(context).canvasColor,size: 16)

                    ]
                ),
              ],
              onTap: (index) {
                if(index==2 && !cubit.isStopped){
                  Timer(Duration(seconds: 1), () => cubit.stopBackgroundTask());
                  //cubit.AsyncFunc(true);
                }
                else if(cubit.isStopped){
                  cubit.startBackgroundTask();
                  //cubit.AsyncFunc(false);
                }


                cubit.changeBotomNavBar(index);
              },
            ),
          ),
        );
      },
    );
  }
}


