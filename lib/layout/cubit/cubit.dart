import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/layout/cubit/states.dart';
import 'package:pfe/modules/home/homeScreen.dart';
import 'package:pfe/modules/queue/queueScreen.dart';
import 'package:pfe/modules/settings/settings_screen.dart';

class pfeCubit extends Cubit<pfeStates>{
  pfeCubit() : super(pfeInitialState());

  static pfeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
  List<Widget> bottomScreens = [
    homeScreen() , queueScreen(),
    settingsScreen()
  ];
  List<bool> greenNavBar = [true , false , false];
  void changeBotomNavBar(int index){
    currentIndex = index ;
    for(int i = 0; i<greenNavBar.length ; i++)
      greenNavBar[i] = false ;
    greenNavBar[index] = true ;
    emit(pfeChangeBottomNavState());
  }

}