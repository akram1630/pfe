import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pfe/shared/components.dart';

import '../login/loginScreen.dart';
import 'cubit/registerCubit.dart';
import 'cubit/registerStates.dart';

class registerScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerCubit(),
      child: BlocConsumer<registerCubit,registerStates>(
        listener: (context , state){},
        builder: (context , state){
          registerCubit cubit = registerCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  navigateTo(context, loginScreen());
                },
                icon: Icon(Icons.keyboard_double_arrow_left_outlined),
              ),
            ),
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
                        Text('REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.black)),
                        Text(
                          'Register now to browse our hot offers',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) return 'please enter your name';
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('User Name'),
                              prefix: Icon(Icons.person)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          validator: (value) {
                            if (value!.isEmpty)
                              return 'please enter your phone number';
                            return null;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Phone Number'),
                              prefix: Icon(Icons.phone)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
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
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
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
                        ),
                        SizedBox(height: 20,),
                        defaultButton(
                            function: (){
                              if(formKey.currentState!.validate()){
                                cubit.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text
                                );
                              }
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
          );
        },
      ),
    );

  }
}