import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

import '../login/loginScreen.dart';

class homeScreen extends StatelessWidget {
  homeScreen(){}
  TextStyle ? myStyle ;
  homeScreen.withStyle({this.myStyle});
  //i did consructor to active dark-mode
  @override
  Widget build(BuildContext context) {
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
                        onPressed: (){},
                        icon: Icon(Icons.search_outlined , color: Colors.white,),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 10,),
                Container(
                  height: 60,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index) => Container(
                        height: 1,
                        child: CircleAvatar(
                          backgroundColor: HexColor(defaultGreen),
                          radius:40 ,
                        ),
                      ) ,
                      separatorBuilder: (context , index) =>SizedBox(width: 10,),
                      itemCount: 10
                  ),
                ),
                SizedBox(height: 5,),
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
                                    'service',style: myStyle!.copyWith(
                                    fontSize: 20,
                                    color: Colors.black
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          child: Text('see more'),
                                          onPressed: (){
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
                                                          Navigator.of(context).pop();
                                                        },
                                                        child: Text("Reserver")
                                                    ),

                                                  ],
                                                  title: Center(child: Column(
                                                    children: [
                                                      for(int i=0; i<20; i++)
                                                      Text("Service info"),
                                                    ],
                                                  )),
                                                  contentPadding: EdgeInsets.all(8),
                                                )
                                            );
                                          },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (context , index) => SizedBox(height: 10,),
                      itemCount: 10
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
