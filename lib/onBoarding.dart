import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taqs/config/extentions/extention.dart';
import 'package:taqs/config/style/text_styles.dart';

import 'features/auth/presentation/pages/login_screen.dart';



class BoardingModel{
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.body
  });
}
class OnBoardingScreen extends StatefulWidget {


  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  bool isLast = false;

  List<BoardingModel>boarding=[
    BoardingModel(
        title: 'Welcome',
        body: 'Welcome to our app! Let get be started.'
    ),
    BoardingModel(
        title: 'Explore',
        body: 'Discover new features and functionalities.'
    ),
    BoardingModel(
        title: 'Get Started',
        body: 'come to dive in and start using the app'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index == boarding.length - 1){
                    setState(() {
                      isLast=true;
                    });
                  }
                  else
                  {
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            40.hs,
            Row(
              children:
              [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.blue,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5.0
                    ),
                    count: boarding.length
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast)
                    {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context)=>LoginScreen()),
                              (route) => false
                      );
                    }
                    else{
                      boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),)

              ],)
          ],
        ),
      ),
    );
  }
}
Widget buildBoardingItem(BoardingModel model)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    30.hs,
    Text(model.title,
      style: AppTextStyle.font24black700),
    15.hs,
    Text(model.body,
      style: AppTextStyle.font16black700),
    30.hs  ],
);