import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/layout/cubit/states.dart';

import '../styles/colors.dart';

class layout extends StatelessWidget {

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  backgroundColor: HexColor(defaultGreen),
                  radius: 22,
                ),
              )
            ],
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Queue',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: Container(

            decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(120),
                topLeft:  Radius.circular(120),
              ),
              child: Container(
                color: Colors.green,
                height: 85,
                child: CurvedNavigationBar(

                  height:55,
                  animationDuration: Duration(milliseconds: 250),
                  color: Colors.white,//HexColor(defaultGreen),//HexColor('#2e68b2'),
                  buttonBackgroundColor: Colors.white,
                  backgroundColor: Colors.white,
                  animationCurve: Curves.easeOutCirc,
                  items: <Widget>[
                    Column(
                      children: [
                        Icon(Icons.home,   size: 35, color: cubit.greenNavBar[0] ? HexColor(defaultGreen) : Colors.black,),
                        Text('Home',
                          style: TextStyle(color: cubit.greenNavBar[0] ? HexColor(defaultGreen) : Colors.black,)
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.query_builder_rounded, size: 35, color: cubit.greenNavBar[1] ? HexColor(defaultGreen) : Colors.black,),
                        Text('Query',
                            style: TextStyle(color: cubit.greenNavBar[1] ? HexColor(defaultGreen) : Colors.black,)
                        )
                      ],
                    ),
                    Column(
                        children:[
                          Icon(Icons.settings_outlined, size: 35 , color: cubit.greenNavBar[2] ? HexColor(defaultGreen) : Colors.black,),
                          Text('Query',
                              style: TextStyle(color: cubit.greenNavBar[2] ? HexColor(defaultGreen) : Colors.black,)
                          )
                        ]
                    ),
                  ],
                  onTap: (index) {
                    cubit.changeBotomNavBar(index);
                  },
                ),
              ),
            ),
          ),
          /*
            bottomNavigationBar: BottomNavigationBar(
            onTap: (indexOfBottom){
              cubit.changeBottom(indexOfBottom);
            },
            currentIndex: cubit.currentIndex,
            selectedLabelStyle: TextStyle(color: HexColor(defaultGreen)),
            selectedIconTheme: IconThemeData(
              color: HexColor(defaultGreen),
          ),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.apps,
                  ),
                  label: 'queue'
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings'
              ),
            ],
          ),*/
        );
      },
    );
  }
}


