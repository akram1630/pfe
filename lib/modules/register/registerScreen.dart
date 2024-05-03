import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:pfe/shared/components.dart';

import '../../styles/colors.dart';
import '../login/loginScreen.dart';
import 'cubit/registerCubit.dart';
import 'cubit/registerStates.dart';

class registerScreen extends StatelessWidget {
  TextEditingController first_nameController = TextEditingController();
  TextEditingController last_nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerCubit(),
      child: BlocConsumer<registerCubit,registerStates>(
        listener: (context , state){
          if(state is registerErrorStates)
            myShowDialog(
                bt1Pressed: (){Navigator.pop(context);},
                btn1: "exit",
                colorBtn1: Colors.red,
                context: context,
                message: "Error",
                nbrButtons: 1,
                bt2Pressed: (){}
            );

          if(state is registerSeccessStates){
            if(state.status){
              myShowDialog(
                  bt1Pressed: (){navigateAndFinish(context, loginScreen());},
                  btn1: "OK",
                  colorBtn1: Colors.green,
                  context: context,
                  message: "Sign-up has done",
                  nbrButtons: 1,
                  bt2Pressed: (){}
              );
            }
          }
        },
        builder: (context , state){
          registerCubit cubit = registerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  navigateAndFinish(context, loginScreen());
                },
                icon: Icon(Icons.keyboard_double_arrow_left_outlined),
              ),
            ),
            body: WillPopScope(
              onWillPop: () async {return false;},
              child: Center(
                child: SingleChildScrollView(
                  // to not let the keyboard makes error on screen
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('REGISTER',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black)),
                          myText(
                            text: 'Register now to browse our hot offers',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          /*TextFormField(
                            keyboardType: TextInputType.name,
                            controller: first_nameController,
                            validator: (value) {
                              if (value!.isEmpty) return 'please enter your name';
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('first ame'),
                                prefix: Icon(Icons.person)),
                          ),*/
                          myTextForm(icon: Icon(Icons.person,color: HexColor(defaultGreen)) ,label: "first name" , controller: first_nameController, ),
                          SizedBox(
                            height: 5,
                          ),
                          myTextForm(icon: Icon(Icons.person,color: HexColor(defaultGreen)) ,label: "last name" , controller: last_nameController, ),
                          /*TextFormField(
                            keyboardType: TextInputType.name,
                            controller: last_nameController,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'please enter your last name';
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('last name'),
                                prefix:Icon(Icons.person) ),
                          ),*/
                          SizedBox(
                            height: 5,
                          ),
                          myTextForm(icon: Icon(Icons.phone,color: HexColor(defaultGreen)) ,label: "phone" , controller: phoneController, ),
                          /*TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) return 'please enter phone number';
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('phone'),
                                prefix: Icon(Icons.phone)),
                          ),*/
                          SizedBox(
                            height: 5,
                          ),
                          myTextForm(icon: Icon(Icons.mail_outline_outlined,color: HexColor(defaultGreen)) ,label: "email" , controller: emailController, numOfForm: 2 ),
                          /*TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) return 'please enter your email';
                              return null;
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Email'),
                                prefix: Icon(Icons.email)),
                          ),*/
                          SizedBox(
                            height: 5,
                          ),
                          myTextForm(icon: Icon(Icons.lock_outline,color: HexColor(defaultGreen)) ,label: "password" , controller: passwordController, numOfForm: 1 ),

                          /*TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) return 'password is too short';
                              return null;
                            },
                            // i want it only when click the register button
                            /*onFieldSubmitted: (str){
                              //print('$str\n\n\n');
                              if(formKey.currentState!.validate()){
                                shopRegisterCubit.get(context).userRegister(
                                    email: emailController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                    password: passwordController.text
                                );
                              }
                            },*/
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('password'),
                              prefix: Icon(Icons.lock_outline),
                              suffix: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_red_eye),
                              ),
                            ),
                          ),*/
                          SizedBox(height: 20,),
                          defaultButton(
                              function: (){
                                print('clicked regi');
                                //if(formKey.currentState!.validate()){
                                  cubit.pfeUserRegister(
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      first_name: first_nameController.text,
                                      last_name: last_nameController.text
                                  );
                                //}
                                /*
                                if(formKey.currentState!.validate()){
                                  cubit.userRegister(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text,
                                      phone: phoneController.text
                                  );
                                }
                                */
                              },
                              text: 'register',
                              isUppercase: true
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