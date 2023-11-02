import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:login_app/View/completed_delivery.dart';
import 'package:login_app/View/earnnings.dart';
import 'package:login_app/View/home_page.dart';
import 'package:login_app/View/profile_edit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final _children = [
    const HomePage(),
    const CompletedDelivery(),
    const Earnings(),
    const ProfileEdit()
  ];

  void onTapped(int i) {
    setState(() {
      _currentIndex = i;
    });
  }

  @override
  void initState() {
    //re appear statusbar in case it was not there in the previous page
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.initState();
  }

  onPop(value) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _children[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTapped,
            currentIndex: _currentIndex,
            backgroundColor: Colors.white.withOpacity(0.8),
            fixedColor: Theme.of(context).hintColor,
            unselectedItemColor: const Color.fromRGBO(153, 153, 153, 1),
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/dashboard.png",
                    color: _currentIndex == 0
                        ? Theme.of(context).hintColor
                        : const Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/delivery.png",
                    color: _currentIndex == 1
                        ? Theme.of(context).hintColor
                        : const Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "My Delivery"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/earnings.png",
                    color: _currentIndex == 2
                        ? Theme.of(context).hintColor
                        : const Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "My Earnings"),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    "assets/images/profile.png",
                    color: _currentIndex == 3
                        ? Theme.of(context).hintColor
                        : const Color.fromRGBO(153, 153, 153, 1),
                    height: 20,
                  ),
                  label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
