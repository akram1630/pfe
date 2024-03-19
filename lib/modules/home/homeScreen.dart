import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/shared/constants.dart';
import 'package:pfe/styles/colors.dart';

import '../login/loginScreen.dart';
import 'homeCubit.dart';
import 'homeStates.dart';

class homeScreen extends StatelessWidget {

  homeScreen(){}
  TextStyle ? myStyle ;
  homeScreen.withStyle({this.myStyle});
  //i did consructor to active dark-mode

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:  (context) => homeCubit()..getCategories()..getAllServices(),
      child: BlocConsumer<homeCubit, homeStates>(
          listener: (context, state) {
            //if()
          },
          builder: (context, state) {
            homeCubit cubit = homeCubit.get(context);
            return Scaffold(
              body : SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Discover our ',
                          style: myStyle!.copyWith(
                              fontSize: 30
                          )
                      ),
                      Row(
                        children: [
                          Text('Latest',
                            style: myStyle!.copyWith(
                                fontSize: 30
                            ),
                          ),
                          Text(' Services',
                            style: myStyle!.copyWith(
                                color: HexColor(defaultGreen),
                                fontSize: 37
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                              )
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: HexColor(defaultGreen),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            child: IconButton(
                              onPressed: (){
                                cubit.getAllServices();
                                cubit.getCategories();
                              },
                              icon: Icon(Icons.search_outlined , color: Colors.white,),
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 10,),
                      if(cubit.categories != null)
                      Container(
                        height: 100,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context , index) => Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: HexColor(defaultGreen),
                                  radius:30 ,
                                ),
                                Text(cubit.categories!.data[index].category!,
                                  style: myStyle,
                                )
                              ],
                            ) ,
                            separatorBuilder: (context , index) =>SizedBox(width: 10,),
                            itemCount: cubit.categories!.data.length
                        ),
                      )
                      else
                        Center(child: CircularProgressIndicator()),
                      SizedBox(height: 5,),
                      if(cubit.all_services != null)
                      Container(
                        height: 500,
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context , index) => Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 10,
                              color: HexColor("#CCCCCC"),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white, // Choose your border color
                                          width: 2.0, // Choose your border width
                                        ),
                                        borderRadius: BorderRadius.circular(10.0), // Adjust the radius for rounded corners
                                      ),
                                      child: Image.asset(
                                        'assets/images/rain.jpg',
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.all_services!.services[index].Service_name!,style: myStyle!.copyWith(
                                            fontSize: 20,
                                            color: Colors.black
                                        ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(

                                              child: TextButton(
                                                child: Text('Reserver',
                                                  style: myStyle,
                                                ),
                                                onPressed: (){
                                                  showDialog(
                                                      context: context,
                                                      builder: (context)=> AlertDialog(
                                                        actions: [

                                                          TextButton(
                                                              onPressed: (){
                                                                cubit.getAllServices();
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: Text("Annuler")
                                                          ),
                                                          TextButton(
                                                              onPressed: (){
                                                                print("the token is $token");
                                                                print(cubit.all_services!.services[index].Service_name);
                                                                idService = cubit.all_services!.services[index].Service_name;
                                                                cubit.registerDate(
                                                                    token: 'Bearer $token',
                                                                    serv_id: cubit.all_services!.services[index].Service_name
                                                                );
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
                                                },
                                              ),
                                              decoration: BoxDecoration(
                                                color: HexColor(defaultGreen)
                                              ),
                                            ),
                                            SizedBox(width: 10,)
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            separatorBuilder: (context , index) => SizedBox(height: 10,),
                            itemCount: /*cubit.all_services == null ? 2 :*/ cubit.all_services!.services.length
                        ),
                      )
                      else
                        Center(child: CircularProgressIndicator()),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
