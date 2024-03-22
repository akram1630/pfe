import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/layout/cubit/states.dart';
import 'package:pfe/styles/colors.dart';

class  editProfile extends StatelessWidget {

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<pfeCubit,pfeStates>(
      listener: (context,state){},
      builder:(context,state){
        pfeCubit cubit = pfeCubit.get(context);
        /*name.text = cubit.user!.first_name! ;
        lastName.text = cubit.user!.last_name! ;
        email.text = cubit.user!.email! ;
        phone.text = cubit.user!.phone_number! ;*/
        return Scaffold(
          appBar: AppBar(),
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
                TextFormField(
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
                ),
                SizedBox(height: 20,),
                TextFormField(
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
                ),
                SizedBox(height: 20,),
                TextFormField(
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
                ),

              ],
            ),
          ),
        );
      } ,
    );
  }
}
