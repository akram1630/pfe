import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/layout/layout.dart';

import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/constants.dart';

import '../../shared/components.dart';
import '../../styles/colors.dart';
import '../home/homeScreen.dart';
import '../register/registerScreen.dart';

import 'cubit/loginCubit.dart';
import 'cubit/loginStates.dart';

class loginScreen extends StatelessWidget {
  //////////////////////////////////////////////////////////////////////
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //////////////////////////////////////////////////////////////////////
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginCubit(),
      child: BlocConsumer<loginCubit, loginStates>(
        //////////////////////////////////////////////////////////////////////
        listener: (context, state) async {
          if(state is loginErrorStates)
            myShowDialog(
                bt1Pressed: (){Navigator.pop(context);},
                btn1: "exit",
                colorMessage: Colors.red,
                colorBtn1: Colors.black,
                context: context,
                message: "error",
                nbrButtons: 1
            );

          if(state is loginSuccessStates){
            if(state.login.status!){
              print('-----token = ${state.login.access}');
              pfeCubit.get(context).startBackgroundTask();
              showDialog(
                  context: context,
                  builder: (context)=> AlertDialog(
                    actions: [

                      TextButton(
                          onPressed: (){

                            Navigator.of(context).pop();
                          },
                          child: Text("Annuler")
                      ),
                      TextButton(
                          onPressed: (){
                            print("show dialog");
                            Navigator.of(context).pop();

                          },
                          child: Text("Reserver")
                      ),

                    ],
                    title: Center(child: Column(
                      children: [
                        Text("Confirm Reservation"),
                      ],
                    )),
                    contentPadding: EdgeInsets.all(8),
                  )
              );
              await cachHelper.saveData(key: 'token' , value: state.login.access)
                .then((value) async {
                  token = await cachHelper.get(key: 'token') ;
                  navigateAndFinish(context, layout(state.login.user!.first_name!));
              });
            }
          }
        },
        //////////////////////////////////////////////////////////////////////
        builder: (context, state) {
          loginCubit cubit = loginCubit.get(context);
          return WillPopScope(
            onWillPop: () async {return false;},
            child: Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  // to not let the keyboard makes error on screen
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        myText(text: 'LOGIN', isBold: true ,size: 30 ),
                        SizedBox(height: 20,),
                        myText(text: 'Login now to benifit our services', isBold: true,size: 15 ),
                          SizedBox(
                            height: 5,
                          ),
                          myTextForm(icon: Icon(Icons.mail_outline,color: HexColor(defaultGreen)) ,label: "Email Address" , controller: emailController,numOfForm: 2 ,  ),
                          SizedBox(
                            height: 15,
                          ),
                          myTextForm(icon: Icon(Icons.lock_outline,color: HexColor(defaultGreen)) ,label: "password" , controller: passwordController,obscureText: cubit.isPassword,prefixPressed: (){cubit.changePassVisibility();},numOfForm: 1,  ),
                          SizedBox(
                            height: 15,
                          ),
                          ConditionalBuilder(
                            condition: state is! loginLoadingStates,
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                            builder: (context) => defaultButton(
                              radius: 10,
                              textColor: HexColor(defaultGreen),
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.pfeLoginUser(
                                      email: emailController.text,
                                      password: passwordController.text
                                  );
                                }
                              },
                              text: 'LOGIN',
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account?' , style: TextStyle(color: HexColor(defaultGray)),),
                              //Spacer(),
                              SizedBox(
                                width: 10,
                              ),
                              TextButton(onPressed: () {
                                navigateAndFinish(context, registerScreen());
                              }, child: Text('REGISTRE'))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
/*TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'please enter ur email address';
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('EMAIL ADDRESS'),
                                prefix: Icon(Icons.email_outlined)),
                          ),*/

/*TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) return 'password is too short';
                              return null;
                            },
                            obscureText: cubit.isPassword,
                            onFieldSubmitted: (str) {
                              if (formKey.currentState!.validate()) {}
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('password'),
                              prefix: Icon(Icons.lock_outline),
                              suffix: IconButton(
                                  onPressed: () {
                                    cubit.changePassVisibility();
                                  },
                                  icon: Icon(cubit.suffixEyePass)),
                            ),
                          ),*/