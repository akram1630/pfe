import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

import '../login/loginScreen.dart';

class homeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hello (user)!' ,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.grey[800],
                      fontSize: 20
                  ),
                ),
                SizedBox(height: 10,),
                Text('Discover our ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.black,
                      fontSize: 37
                  ),
                ),
                Row(
                  children: [
                    Text('last',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.black,
                          fontSize: 37
                      ),
                    ),
                    Text(' Services',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: HexColor(defaultGreen)),
                            )  ,
                            border: UnderlineInputBorder(),
                            hintText: ' search',
                          ),
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
                  height: 100,
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
                SizedBox(height: 10,),
                ListView.separated(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context , index) => Card(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/rain.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('service',style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 20
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('see more'),
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
                )
              ],
            ),
          ),
      ),
    );
  }
}
