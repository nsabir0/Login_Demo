import 'package:flutter/material.dart';
import 'package:login_app/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*return ScreenUtilInit(
      designSize: Size(800, 1200),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {*/
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ScreenUtils(),
        );
     /* },
    );*/
  }
}

class ScreenUtils extends StatefulWidget {
  const ScreenUtils({super.key});

  @override
  State<ScreenUtils> createState() => _ScreenUtilsState();
}

class _ScreenUtilsState extends State<ScreenUtils> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
      designSize: Size(width / 2, height),
      builder: (_, child){
        return Login();
      },
    );
  }
}

