import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/layout.dart';

import 'package:pfe/shared/cache_helper.dart';

import '../../shared/components.dart';
import '../../styles/colors.dart';
import '../home/homeScreen.dart';
import '../register/registerScreen.dart';

import 'cubit/loginCubit.dart';
import 'cubit/loginStates.dart';

class loginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginCubit(),
      child: BlocConsumer<loginCubit, loginStates>(
        listener: (context, state) {
          if(state is loginSuccessStates){
            if(state.loginMod.status!){
              cachHelper.saveData(key: 'token' , value: state.loginMod.data!.token!)
                .then((value){
                  navigateAndFinish(context, layout());
              });
            }
          }
        },
        builder: (context, state) {
          loginCubit cubit = loginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                // to not let the keyboard makes error on screen
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        Text(
                          'Login now to benifit our services',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: HexColor(defaultGray)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                          condition: state is! loginLoadingStates,
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                          builder: (context) => defaultButton(
                            radius: 10,
                            function: () {
                              /*
                              if (formKey.currentState!.validate()) {
                                cubit.loginUser(
                                    email: emailController.text,
                                    password: passwordController.text
                                );

                              }
                              */
                            },
                            text: 'LOGIN',
                            isUppercase: true,
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
                              navigateTo(context, registerScreen());
                            }, child: Text('REGISTRE'))
                          ],
                        )
                      ],
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
