import 'package:flutter/material.dart';
import 'package:graduation/componants/componant.dart';
import 'package:graduation/dio_helper/cashe_helper.dart';
import 'package:graduation/login/loginscreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:theshop/dio_helper/cashe_helper.dart';

// import '../componants/componant.dart';
// import '../screens/login/loginscreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class bordringmodel {
  String image1;
  String title;
  String body;
  bordringmodel(
      {required this.image1, required this.title, required this.body});
}

bool islast = false;

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  List<bordringmodel> bordring = [
    bordringmodel(
        image1:
            "https://img.freepik.com/free-vector/online-shopping-abstract-concept-illustration_335657-3714.jpg?t=st=1653053211~exp=1653053811~hmac=4badcf855f9f20f68ee4e423203e35ff96120100047932133de910a40f050ec2&w=740",
        title: "title1",
        body: "body1"),
    bordringmodel(
        image1:
            "https://img.freepik.com/free-vector/people-standing-holding-shopping-bags_23-2148825441.jpg?size=626&ext=jpg&uid=R34164859&ga=GA1.2.1474716804.1645288850",
        title: "title2",
        body: "body2"),
    bordringmodel(
        image1:
            "https://img.freepik.com/free-vector/online-shopping-concept-illustration_114360-1084.jpg?size=626&ext=jpg&uid=R34164859&ga=GA1.2.1474716804.1645288850",
        title: "title3",
        body: "body3")
  ];
  var _pagecontroller = PageController();
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  finash_navigate(context, login_screen());
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                  child: PageView.builder(
                onPageChanged: (val) {
                  if (val == bordring.length - 1) {
                    setState(() {
                      print("last");
                      islast = true;
                    });
                  } else {
                    print("notlast");
                    islast = false;
                  }
                },
                controller: _pagecontroller,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Image.network("${bordring[index].image1}")),
                        Text(
                          "${bordring[index].title}",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        Text("${bordring[index].body}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400))
                      ],
                    ),
                  );
                },
                itemCount: bordring.length,
              )),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: _pagecontroller,
                    count: bordring.length,
                    effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.blue,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 4,
                        spacing: 5.0),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      islast == false
                          ? _pagecontroller.nextPage(
                              duration: Duration(microseconds: 500),
                              curve: Curves.bounceOut)
                          : finash_navigate(context, login_screen());
                    },
                    child: const Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              )
            ],
          ),
        ));
  }

  // void submitte() {
  //   CacheHelper.savedata(key: "onboarding", value: true)
  //       .then((_) => finash_navigate(context, login_screen()));
  // }
}
