import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/layout/cubit/states.dart';
import 'package:pfe/layout/layout.dart';
import 'package:pfe/modules/settings/settings_screen.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

import '../../shared/constants.dart';

class  editProfile extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<pfeCubit,pfeStates>(
      listener: (context,state){

      },
      builder:(context,state){
        pfeCubit cubit = pfeCubit.get(context);
        if(cubit.user != null){
          name.text = cubit.user!.first_name! ;
          lastName.text = cubit.user!.last_name! ;
          email.text = cubit.user!.email! ;
          phone.text = cubit.user!.phone_number! ;
        }
        else
          cubit.getUser(token);
        return WillPopScope(
          onWillPop: () async {return false;},
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: (){
                  cubit.startBackgroundTask();
                  navigateAndFinish(context, layout(cubit.user!.first_name!));
                },
                icon: Icon(Icons.arrow_back),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(cubit.user != null ? 'https://mypfe.cntic-club.com${cubit.user!.Profile_pic}' : 'https://w7.pngwing.com/pngs/178/595/png-transparent-user-profile-computer-icons-login-user-avatars.png'),
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  myTextForm(icon: Icon(Icons.person,color: HexColor(defaultGreen)) ,label: "first name" , controller: name, ),
                  SizedBox(height: 20,),
                  myTextForm(icon: Icon(Icons.person,color: HexColor(defaultGreen)) ,label: "first name" , controller: lastName, ),
                  SizedBox(height: 20,),
                  myTextForm(icon: Icon(Icons.mail_outline_outlined,color: HexColor(defaultGreen)) ,label: "email" , controller: email, numOfForm: 2 ),
                  SizedBox(height: 20,),
                  myTextForm(icon: Icon(Icons.phone,color: HexColor(defaultGreen)) ,label: "phone" , controller: phone, ),
                  SizedBox(height: 20,),
                  defaultButton(
                      function: (){
                        cubit.updateUser(
                          email: email.text,
                          first_name: name.text,
                          last_name: lastName.text,
                          phone_number: phone.text
                        );
                      },
                      text: 'Update',
                    color: HexColor(defaultGreen)
                  )
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
}
/*TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        child: Icon(Icons.person_outline),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),*/
/*TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        child: Icon(Icons.people_outline),
                      ),
                      border: UnderlineInputBorder(),

                    ),
                  ),*/
/*TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        child: Icon(Icons.email_outlined),
                      ),
                      border: UnderlineInputBorder(),

                    ),
                  ),*/
/*TextFormField(
                    controller: phone,
                    decoration: InputDecoration(
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10
                        ),
                        child: Icon(Icons.phone),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),*/