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
        listener: (context, state) {},
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
                                    height: 10,
                                  ),
                                  myText(text: objects!.data[index].service!, isBold: true,context: context,size: 30,),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            myText(text: 'Your', isBold: true),
                                            myText(text: 'Position : ', isBold: true,size: 20),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          children: [
                                            myText(text: objects!.data[index].place!.toString(), isBold: true),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          children: [
                                            Icon(Icons.person_outline, size: 50),
                                            myText(text: 'before you', isBold: true),

                                            myText(text: objects!.data[index].clients_before.toString(), isBold: true),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)
                                            )
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: Column(
                                          children: [
                                            Icon(Icons.more_time_outlined, size: 50),
                                            myText(text: 'estimation', isBold: true,size: 20),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                              children: [
                                                myText(text: (objects!.data[index].clients_before! * 5).toString(), isBold: true,color: Colors.green),
                                                myText(context: context ,text: 'minutes', isBold: true,size: 15)
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: defaultButton(
                                        function: ()  {
                                          print('clicked');
                                          pfeCubit.get(context).deleteDate(id_date: objects!.data[index].id.toString());

                                        },
                                        text: 'Cancel',
                                        radius: 10,
                                        width: 200,
                                        color: Colors.red),
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