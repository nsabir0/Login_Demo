import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/Components/app_theme.dart';
import 'package:login_app/View/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return ScreenUtilInit(
        designSize: Size(screenSize.width, screenSize.height),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              title: 'LOGIN APP',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.orange,
                scaffoldBackgroundColor: MyTheme.accent_color,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                hintColor: MyTheme.soft_accent_color,
                /*textTheme: TextTheme(
                      bodyText1: TextStyle(),
                      bodyText2: TextStyle(fontSize: 12.0),
                  )*/
                //
                // the below code is getting fonts from http
                textTheme: GoogleFonts.sourceSans3TextTheme(textTheme).copyWith(
                  bodyLarge:
                      GoogleFonts.sourceSans3(textStyle: textTheme.bodyLarge),
                  bodyMedium: GoogleFonts.sourceSans3(
                      textStyle: textTheme.bodyMedium, fontSize: 12),
                ),
              ),
              home: const Login());
        });
  }
}
