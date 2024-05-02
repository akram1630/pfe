import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pfe/shared/components.dart';

class infoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              for(int i=0; i<10; i++)
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    myText(text: 'AKRAM'),
                    Row(
                      children: [
                        Expanded(
                            flex : 3,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: myText(text: 'oqjndosdfksqdfqdq'
                                  'qerqerqeqerqersefsdmfl,df'
                                  'sdfsdflknsdfksdsdsd'
                                  'qsqsdqdqdqdldflk'),
                            )),
                        Expanded(
                            flex: 1,
                            child: Icon(Icons.account_box_outlined,
                            size: 80),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/github-mark.svg" ,
                          width: 45,
                          height: 45,
                        ),
                        SizedBox(width: 15,),
                        SvgPicture.asset(
                          "assets/images/icons8-linkedin.svg" ,
                          width: 50,
                          height: 50,
                        ),

                      ],
                    ),
                    SizedBox(height: 100,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
