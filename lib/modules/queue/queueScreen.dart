import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/styles/colors.dart';

class queueScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              color: Colors.blue[100],
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Text('AKRAM',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20
                      )
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Text(' Algerie Telecome ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                          color: HexColor(defaultGreen)
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Actual',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            Text('Position : ',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            Text('70',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 45,
                                  color: Colors.yellow[700]
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.all(6),
                        child: Column(
                          children: [
                            Icon(Icons.person_outline,size: 50),
                            Text('Position',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                              ),
                            ),
                            Text('20',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 20,
                                    color: HexColor(defaultGreen)
                                )
                            )
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.all(6),
                        child: Column(
                          children: [
                            Icon(Icons.more_time_outlined,size: 50),
                            Text('time estimation',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 20
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('30',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 20,
                                        color: HexColor(defaultGreen)
                                    )
                                ),
                                Text('minutes',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: 10
                                    )
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: defaultButton(
                        function: ()async{
                          print('clicked');

                          showDialog(
                              context: context,
                              builder: (context)=> AlertDialog(
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("NO")
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("YES")
                                  ),

                                ],
                                title: Center(child: Text("Do you want to cancel")),
                                contentPadding: EdgeInsets.all(8),
                              )
                          );
                        },
                        text: 'Cancel',
                        radius: 10,
                        width: 200,
                        color: Colors.red
                    ),
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),
            Card(
              elevation: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AKRAM',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 20
                    )
                  ),
                  SizedBox(height: 20,),
                  Center(
                      child: Text('Service',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 20,
                            color: HexColor(defaultGreen)
                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Actual',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                            ),
                          ),
                          Text('Position : ',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 15,),
                      Column(
                        children: [
                          Text('70',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 45,
                              color: Colors.yellow[700]
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.person_outline,size: 50),
                          Text('Position',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                            ),
                          ),
                          Text('20',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20,
                                color: Colors.yellow[700]
                            )
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        children: [
                          Icon(Icons.more_time_outlined,size: 50),
                          Text('time estimation',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 20
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('30',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 20,
                                    color: Colors.yellow[700]
                                )
                              ),
                              Text('minutes',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 10
                                )
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: defaultButton(
                        function: (){},
                        text: 'Cancel',
                        radius: 10,
                         width: 200,
                      color: Colors.red
                    ),
                  ),
                  SizedBox(height: 15,)
                ],
              ),
            ),

          ],
        ),
      ),
    ) ;

  }
}

