import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/layout/cubit/states.dart';
import 'package:pfe/models/userModel.dart';
import 'package:pfe/modules/home/homeScreen.dart';
import 'package:pfe/modules/queue/queueScreen.dart';
import 'package:pfe/modules/settings/settings_screen.dart';
import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/dio_helper.dart';

import '../../models/allServicesModel.dart';
import '../../models/categories_model.dart';
import '../../models/relatedObjectsModel.dart';
import '../../shared/constants.dart';

class pfeCubit extends Cubit<pfeStates>{
  pfeCubit() : super(pfeInitialState());

  static pfeCubit get(context) => BlocProvider.of(context);



  int currentIndex = 0 ;
  List<Widget> bottomScreens = [
    homeScreen() , queueScreen(),
    settingsScreen()
  ];
  Widget whichScreen(int index , context){
    //getReletedObj();
    if(index == 0)
      return homeScreen.withStyle(
        myStyle: Theme.of(context).textTheme.bodyText1!,
      );
    if(index == 1)
      return queueScreen();
    return settingsScreen();
  }
  List<bool> greenNavBar = [true , false , false];
  void changeBotomNavBar(int index){
    currentIndex = index ;
    for(int i = 0; i<greenNavBar.length ; i++)
      greenNavBar[i] = false ;
    greenNavBar[index] = true ;
    emit(pfeChangeBottomNavState());
  }

  bool isDarkMode = false ;
  Future<void> changeThemeMode(bool dark) async {
    isDarkMode = !dark ;
    await cachHelper.putBoolean(key: 'isDarkMode', value: !dark)
        .then((value){
          emit(pfeChangeThemeModeState());
        });
  }
  userModel ? user ;
  void getUser(String ? token){
    emit(pfeGetUserLoadingState());
    dioHelper.getData(
      url: 'auth/Client_Profile/',
      token: 'Bearer $token',
    ).then((value){
      user = userModel.fromJson(value.data);
      emit(pfeGetUserSuccessState());
    }).catchError((err){
      emit(pfeGetUserErrorState());
      print(err.toString());
    });
  }


  void getReletedObj(){
    emit(pfeGetRelatedObjectsLoadingState());
    dioHelper.getData(
        url: 'Api/Related_objects/',
        token: 'Bearer $token'
    ).then((value){
      print(value.data);
      objects = relatedObjectsModel.fromJson(value.data);
      emit(pfeGetRelatedObjectsSeccessState());
    })
        .catchError((err){
      print(err.toString());
      emit(pfeGetRelatedObjectsErrorState());
    });
  }
  void getReletedObjAsync(SendPort sendPort){
    emit(pfeGetRelatedObjectsLoadingState());
    for(int i=0; i<100000000000; i++)
    dioHelper.getData(
        url: 'Api/Related_objects/',
        token: 'Bearer $token'
    ).then((value){
      print(value.data);
      objects = relatedObjectsModel.fromJson(value.data);
      emit(pfeGetRelatedObjectsSeccessState());
    })
        .catchError((err){
      print(err.toString());
      emit(pfeGetRelatedObjectsErrorState());
    });
    sendPort.send('Thread completed');
  }
  void startBackgroundTask() {
    Timer.periodic(Duration(seconds: 2), (Timer t) {
      // Call your function here
      getReletedObj();
    });
  }
  void deleteDate({required String id_date }){
    emit(pfeDeleteDateLoadingState());
    dioHelper.delete(
        data: {},
        url: 'Api/Delete_Date/$id_date/', //id of date
        token: 'Bearer $token'
    ).then((value){
      print(value.data);
      getReletedObj();
      emit(pfeDeleteDateSeccessState());

    })
        .catchError((err){

      print(err.toString());
      emit(pfeDeleteDateErrorState());
    });
  }

  allServices ? all_services ;
  void getAllServices(){
    emit(pfeGetServicesLoadingState());
    dioHelper.getData(url: 'Api/All_Services/' )
        .then((value){
      all_services = allServices.fromJson(value.data) ;
      print(all_services!.services.length);
      emit(pfeGetServicesSuccessState());
    })
        .catchError((err){
      print(err.toString());
      emit(pfeGetServicesErrorState());
    });
  }

  categoriesModel ? categories ;
  void getCategories(){
    emit(pfeGetCategoriesLoadingState());

    dioHelper.getData(url: 'Api/All_Categories/' )
        .then((value){
      print(value.data);
      categories = categoriesModel.fromJson(json: value.data);
      emit(pfeGetCategoriesLoadingState());
    })
        .catchError((err){
      print(err.toString());
      emit(pfeGetCategoriesErrorState());

    });
  }

  void registerDate({
    required String ? token,
    required String ? serv_id,

  }){
    emit(pfeRegisterDateLoadingState());
    dioHelper.postData(
        url: 'Api/RegisterDate/',
        data: {
          "serv_id" : serv_id
        },
        token: token
    ).then((value){
      getReletedObj();
      print(value.data);
      emit(pfeRegisterDateSuccessState());
    }).catchError((err){
      print(err.toString());
      emit(pfeRegisterDateErrorState());
    });
  }
  Future<void> refreshing() async {

    for(int i=0; i<1000000; i++){
      final receivePort = ReceivePort(); //another thread with main thread
      await Isolate.spawn(getReletedObjAsync, receivePort.sendPort);
    }
      
  }
}