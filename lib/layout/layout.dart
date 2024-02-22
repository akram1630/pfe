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
          ),
        );
      },
    );
  }
}
