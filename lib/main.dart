import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pfe/api_test.dart';
import 'package:pfe/layout/cubit/states.dart';

import 'package:pfe/shared/bloc_observer.dart';
import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/constants.dart';
import 'package:pfe/shared/dio_helper.dart';
import 'package:pfe/styles/themes.dart';

import 'layout/cubit/cubit.dart';
import 'layout/layout.dart';
import 'modules/home/homeScreen.dart';
import 'modules/login/loginScreen.dart';
import 'modules/on_boarding/onBoardingScreen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // to make sure that all lines complete theie execution befor runApp();
  await Future.delayed(Duration(seconds: 2));
  FlutterNativeSplash.remove();
  await cachHelper.init();
  testApi.init();
  dioHelper.init();
  Bloc.observer = MyBlocObserver();
  bool ? isDarkMode = await cachHelper.get(key: 'isDarkMode');
  if(isDarkMode == null)
    await cachHelper.putBoolean(key: 'isDarkMode', value: false).then((value) {
      isDarkMode = false ;
    });

  Widget page ;
  bool ? onBoarding = await cachHelper.get(key: 'onBoarding');
  token = await cachHelper.get(key: 'token'); // token is constants components
  print('------------------> token : $token');
  //printFullText(token!);
  //print('the onBoarding is : $onBoarding');
  Widget ? widget ;
  if(token != null){  // (onBoarding! != null)Null check operator used on a null value
    widget = layout();
  }
  else if(onBoarding != null){
    widget = loginScreen();
  }
  else{
    widget = onBoardingScreen();
  }


  runApp(MyApp(widget! , isDarkMode));
}

class MyApp extends StatelessWidget {
  Widget page ;
  bool ? isDarkMode ;
  MyApp(this.page , this.isDarkMode);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => pfeCubit(),
      child: BlocConsumer<pfeCubit , pfeStates>(
        listener: (context,state){},
        builder:  (context,state){
          return MaterialApp(
            theme: myLightMode,
            darkTheme: myDarkMode,
            themeMode: pfeCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: page ,
          );
        }

      ),
    );
  }
}




