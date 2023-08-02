import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:tasty_food/login_screens/login_screen.dart';
import 'package:tasty_food/screens/splash_screen.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int _currentIndex = 0;
  bool stop = true;
  List<Map<String,dynamic>> slide=[
  {"image":"assets/images/pngwing.com.png","text":"Discover Restaurant Near You"},
  {"image":"assets/images/pngegg.png","text":"Choose A Tasty Dish"},
  {"image":"assets/images/cycling.png","text":"Pick Up Or Delivery"},
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
              items: slide.map((item) {
                String image = item["image"];
                String text = item["text"];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
                            },
                              child: const Text("Skip",style:  TextStyle(fontSize: 20,color: Colors.orange),)),
                          const Icon(Icons.arrow_forward_ios_rounded,color: Colors.orange,size: 15,),
                        ],
                      ),

                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
                        ),
                      ),
                      const SizedBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal:30 ),
                          child: Text(text,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w900,),maxLines: 2,textAlign: TextAlign.center)),

                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
                height: MediaQuery.of(context).size.height * 0.9,
                onPageChanged: (index, reason) {
                  setState(() {
                      _currentIndex= index;
                  });
                }
              ),
          ),
          DotsIndicator(
            dotsCount: slide.length,
            position: _currentIndex.toInt(),
            decorator: DotsDecorator(
              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              activeSize: const Size(25, 9),
              spacing: const EdgeInsets.all(2),
              size:const Size(25, 9) ,
              color: Colors.grey, // Inactive color
              activeColor: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }

  }
  


