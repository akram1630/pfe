import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/layout/cubit/cubit.dart';
import 'package:pfe/shared/components.dart';
import 'package:pfe/shared/constants.dart';
import 'package:pfe/styles/colors.dart';

import '../../layout/cubit/states.dart';

class queueScreen extends StatefulWidget {
  @override
  State<queueScreen> createState() => _queueScreenState();
}

class _queueScreenState extends State<queueScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<pfeCubit, pfeStates>(
        listener: (context, state) {
          if(state is pfeDeleteDateSeccessState)
            myShowDialog(
              context: context,
              nbrButtons: 1,
              message: 'Cancelling has done',
              btn1: 'Ok',
              bt1Pressed: (){Navigator.of(context).pop();},
              bt2Pressed: (){},
              colorBtn1: Colors.green,
            );
          if(state is pfeDeleteDateErrorState)
            myShowDialog(
              context: context,
              nbrButtons: 1,
              message: 'Cancelling has failed',
              btn1: 'Ok',
              bt1Pressed: (){Navigator.of(context).pop();},
              bt2Pressed: (){},
              colorBtn1: Colors.red,
            );
        },
        builder: (context, state) {
          pfeCubit cubit = pfeCubit.get(context);
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 10,
                      child: Container(
                        height: 10,
                        width: double.infinity,
                        color: HexColor(defaultGreen),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  if(objects != null)
                    if(objects!.data.length != 0)
                    Container(
                      height: 550,
                      child: ListView.separated(
                          itemBuilder:(context , index){
                            return Card(
                              color: Colors.blue[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  myText(text: objects!.data[index].service!, isBold: true,context: context,size: 30,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 200,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              myText(text: 'Your', isBold: true , size: 23),
                                              myText(text: 'Position : ', isBold: true,size: 23),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        myText(text: objects!.data[index].place!.toString(), isBold: true,color: HexColor(defaultGreen)   ,size: 40),
                                        SizedBox(width: 10,)
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    padding: EdgeInsets.all(6),
                                    child: Column(
                                      children: [
                                        Container(
                                           width: 200,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      myText(text: 'Before', isBold: true , size: 23),
                                                      myText(text: 'You :', isBold: true , size: 23,),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 15,),
                                                myText(text: (objects!.data[index].clients_before).toString(), size: 40,color: HexColor(defaultGreen)),
                                                SizedBox(width: 10,)
                                              ],
                                            )),
                                       // myText(text: 'before you', isBold: true),

                                       // myText(text: objects!.data[index].clients_before.toString(), isBold: true),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 220,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)
                                        )
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  myText(text: 'Estimated', isBold: true,size: 23),
                                                  myText(text: 'Time (min) : '  , isBold: true,size: 23),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                myText(text: (objects!.data[index].clients_before! * 5).toString(), isBold: true,color: Colors.green,size: 40),
                                             //   myText(context: context ,text: 'min',   isBold: true,size: 15),
                                                SizedBox(width: 10,)
                                              ],
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: defaultButton(
                                        function: ()  {
                                          print('clicked');
                                          myShowDialog(
                                              context: context,
                                              nbrButtons: 2,
                                              message: 'Cancel',
                                              btn1: 'yes',
                                              bt1Pressed: (){
                                                pfeCubit.get(context).deleteDate(id_date: objects!.data[index].id.toString());
                                                Navigator.of(context).pop();
                                              },
                                              btn2: 'no',
                                              colorBtn2: Colors.red[400],
                                              bt2Pressed: (){
                                                Navigator.of(context).pop();
                                              },
                                              colorBtn1: Colors.green
                                          );
                                        },
                                        text: 'Cancel',
                                        radius: 10,
                                        width: 200,
                                        color: Colors.red[500]
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context , index){
                            return SizedBox(height: 10,);
                          },
                          itemCount: objects!.data.length
                      ),
                    ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
// Text(objects!.data[index].service!,
//     style: Theme.of(context)
//         .textTheme
//         .bodyText1!
//         .copyWith(
//         fontSize: 20, color: Colors.black)
// ),