import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/Screens/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: Login()
          );
        }
    );
  }
}
