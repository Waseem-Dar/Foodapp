import 'package:flutter/material.dart';
import 'home_screen.dart';
class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key, }) : super(key: key);

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  final List<Widget> _tabs = [

  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          fixedColor:Colors.black ,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(

              icon: Icon(Icons.home,color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart,color: Colors.black,),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.black,),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
