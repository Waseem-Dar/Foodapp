
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tasty_food/login_screens/login_screen.dart';
import 'package:tasty_food/screens/Detail_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Map<String, dynamic>> _rowList = [
    {"image":"assets/images/p1.jpg","name":"Chines Break Fast"},
    {"image":"assets/images/p2.jpg","name":"Chicken Fry"},
    {"image":"assets/images/p3.jpg","name":"Tasty Food"},
    {"image":"assets/images/p4.jpg","name":"Chicken Biryani"},
    {"image":"assets/images/p5.jpg","name":"Chines Break Fast"},
    {"image":"assets/images/p6.jpg","name":"Broast & Rolls"},

  ];
  final List<Map<String, dynamic>> rowList = [
    {"image":"assets/images/pizza.png","name":"Pizza"},
    {"image":"assets/images/burger.png","name":"Burgers"},
    {"image":"assets/images/broast.png","name":"Broast"},
    {"image":"assets/images/shakes.png","name":"Shakes"},
    {"image":"assets/images/nihari.png","name":"Nihari"},
    {"image":"assets/images/biryani.png","name":"Biryani"},
    {"image":"assets/images/healthy.png","name":"Healthy Food"},
    {"image":"assets/images/wrap.png","name":"Wraps & Rolls"},

  ];
   final List<Map<String, dynamic>> _columnList = [
    {"image":"assets/images/p11.jpg","imageSecond":"assets/images/p10.jpg","name":"Arizona Biltmore Restaurant"},
    {"image":"assets/images/p9.jpg","imageSecond":"assets/images/p8.jpg","name":"Arizona Biltmore Restaurant"},
    {"image":"assets/images/p1.jpg","imageSecond":"assets/images/p6.jpg","name":"Arizona Biltmore Restaurant"},
    {"image":"assets/images/p4.jpg","imageSecond":"assets/images/p3.jpg","name":"Arizona Biltmore Restaurant"},
    {"image":"assets/images/p2.jpg","imageSecond":"assets/images/p1.jpg","name":"Arizona Biltmore Restaurant"},
    {"image":"assets/images/p7.jpg","imageSecond":"assets/images/p6.jpg","name":"Arizona Biltmore Restaurant"},
     {"image":"assets/images/p9.jpg","imageSecond":"assets/images/p8.jpg","name":"Arizona Biltmore Restaurant"},
    {"image":"assets/images/p4.jpg","imageSecond":"assets/images/p10.jpg","name":"Arizona Biltmore Restaurant"},
     {"image":"assets/images/p1.jpg","imageSecond":"assets/images/p6.jpg","name":"Arizona Biltmore Restaurant"},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        child: ListView(
          children:  [
            const SizedBox(
              height: 200,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.orange),
                  child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  Text("User Name")
                ],
              )),
            ),
            Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.help_outline_rounded,color: Colors.orange,),
                  title: Text("Help center"),
                ),
                const ListTile(
                  leading: Icon(Icons.business_rounded,color: Colors.orange,),
                  title: Text("Arizona for business"),
                ),
                const ListTile(
                  leading: Icon(Icons.card_giftcard_rounded,color: Colors.orange,),
                  title: Text("Invite friends"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Terms & conditions"),
                ),
                ListTile(
                  onTap: (){
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LogInScreen(),));
                    });
                  },
                  leading: const Icon(Icons.login_rounded,color: Colors.orange,),
                  title: const Text("Log out"),
                ),
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        flexibleSpace: _appbar(),
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height *0.15,
      ),
      backgroundColor: Colors.white,
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Trending this week",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.010,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: _rowList.map((item) {
                          String name = item['name'];
                          String image = item['image'];
                          return Card(
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap:() {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: image, name: name,),));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.75,
                                    height: MediaQuery.of(context).size.height * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                                      image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(name,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                                      const Text("Food and Break Fast Delivery"),
                                      RatingBar.builder(
                                        itemSize: 20,
                                      initialRating: 4,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.only(right: 5),
                                      itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                      },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.020,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Cuisines",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: rowList.map((item) {
                          String image = item["image"];
                          String name = item["name"];
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: image, name: name),));
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(image: AssetImage(image)),
                                    ),
                                  ),
                                ),
                                Text(name),
                              ],
                            ),
                          );
                        }).toList(), // Add .toList() to convert the mapped items to a List
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.015,),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Most Popular",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
                        Text("view all",style: TextStyle(color: Colors.orange,fontSize: 17),),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.010,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: _columnList.map((item){
                        String firstImage = item['image'];
                        String secondImage = item['imageSecond'];
                        String name = item['name'];
                        return   Card(
                          color: Colors.white,
                           margin: const EdgeInsets.symmetric(vertical: 8),
                          shape: const RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap:() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: firstImage, name: name),));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      height: MediaQuery.of(context).size.height * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),),
                                        image: DecorationImage(image: AssetImage(firstImage),fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap:() {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: secondImage, name: 'null',),));
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      height: MediaQuery.of(context).size.height * 0.15,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(topRight: Radius.circular(5)),
                                        image: DecorationImage(image: AssetImage(secondImage),fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name,style: const TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
                                    const Text("Food and Break Fast Delivery"),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        RatingBar.builder(
                                          itemSize: 20,
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: const EdgeInsets.only(right: 5),
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                          },
                                        ),
                                        const Text("Open 11:00 AM"),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }
  Widget _appbar(){
    return Container(
      color:Colors.orange,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: MediaQuery.of(context).size.height *0.20,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 25,),
           Row(
            children: [
              IconButton(
                alignment: Alignment.topLeft,
                color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: (){
                  _scaffoldKey.currentState?.openDrawer();
                  }, icon: const Icon(Icons.menu)),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Arizona Restaurant",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("Islamabad",style: TextStyle(color: Colors.white,fontSize: 17),),
                ],
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                    alignment: Alignment.topRight,
                padding: EdgeInsets.zero,
                color: Colors.white,
                  onPressed: (){}, icon: const Icon(Icons.notifications))
            ],
          ),
          TextFormField(
            cursorColor: Colors.grey,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.all(Radius.circular(25))),
                filled: true,
                fillColor: Colors.white,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search,color: Colors.grey,)
            ),
          ),
        ],
      ) ,
    );
  }

}
