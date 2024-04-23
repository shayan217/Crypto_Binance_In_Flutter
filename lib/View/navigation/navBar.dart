import 'package:binance/View/Search/search.dart';
import 'package:binance/View/notification/notification.dart';
import 'package:binance/View/profile/profile.dart';
import 'package:binance/View/secondpage/secondpage.dart';
import 'package:binance/utils/color.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import 'package:iconsax/iconsax.dart';


class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  List<Widget> pages = [
    Home(),
    SecondPage(),
    SearchPage(),
    MyApp(),
    ProfilePage(), 
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: RColor.secondary,
        body: pages.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: RColor.secondary,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          onTap: ((value) {
            setState(() {
              _currentIndex = value;
            });
          }),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/1.1.png',
                height: myHeight * 0.03,
                color: Colors.grey,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/1.2.png',
                height: myHeight * 0.03,
                color: Color(0xffFBC700),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.buy_crypto,color: Colors.grey,),
              label: '',
              activeIcon: Icon(Iconsax.buy_crypto5,color: Colors.amber,)
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_favorite,color: Colors.grey,),
              label: '',
              activeIcon: Icon(Iconsax.search_favorite,color: Colors.amber,)
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.notification_bing5,color: Colors.grey,),
              label: '',
              activeIcon: Icon(Iconsax.notification_bing5,color: Colors.amber,),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/4.1.png',
                height: myHeight * 0.03,
                color: Colors.grey,
              ),
              label: '',
              activeIcon: Image.asset(
                'assets/icons/4.2.png',
                height: myHeight * 0.03,
                color: Color(0xffFBC700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
