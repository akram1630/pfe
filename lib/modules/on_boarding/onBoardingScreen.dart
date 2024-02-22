import 'package:flutter/material.dart';
import 'package:pfe/shared/cache_helper.dart';
import 'package:pfe/shared/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../login/loginScreen.dart';

class boardingModel{
  boardingModel({required this.image , required this.title , required this.body});
  final String image;
  final String title;
  final String body;
}

class onBoardingScreen extends StatefulWidget {
  
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {

  List<boardingModel> boarding = [
    boardingModel(image: 'assets/images/rain.jpg' , title: 'onBoard1 salam', body: '--------1'),
    boardingModel(image: 'assets/images/stood.jpg' , title: 'onBoard2 mar7na',body: '--------2'),
    boardingModel(image: 'assets/images/people.jpg' , title: 'onBoard3 bikom', body: '--------3'),
  ];

  bool isLast = false;

  PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Text('SKIP'),
            onPressed: (){
              submit();
            },
          )
        ],
      ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder( //page not list
                  physics: BouncingScrollPhysics(), // when screens finish , user won't see grey color in the side
                  controller: boardController,
                    itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                    onPageChanged: (index){
                      setState(() {
                        isLast = (index == boarding.length - 1) ? true : false ;
                        print((index == boarding.length - 1) ? 'last' : 'not last');
                      });
                  },
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey, // no selected color
                        activeDotColor: Colors.blue ,     // selected color
                        dotHeight: 10 ,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4 ,
                      ),
                  ),
                  Spacer(), // it throw widgets like SizedBox(width: double.infinity,)
                  FloatingActionButton(
                      onPressed: (){
                        if(isLast){
                          submit();
                        }
                        else{
                          boardController.nextPage(
                            duration: Duration(
                                milliseconds: 750
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }

                      },
                      child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
  void submit()async{ //cuz saveData is a Future<>
    cachHelper.saveData(key: 'onBoarding', value: true).then((value){
      if(value){
        navigateAndFinish(context, loginScreen());
        //navigateAndFinish(context, loginScreen());
      }
    });
  }
  Widget buildBoardingItem(boardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage(model.image)
        ),
      ),
      SizedBox(height: 40,),
      Text(
        model.title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 40,),
      Text(
        model.body,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 40,),
    ],
  );
}
