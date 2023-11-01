import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/Components/app_theme.dart';
import 'package:login_app/View/signup_page.dart';
import 'package:login_app/Widgets/spacing.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 250.w,
                child: Image.asset(
                  "assets/images/splash_login_background_logo.png",
                  color: MyTheme.splash_login_background_logo_color,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: SizedBox(
                          width: 75.w,
                          child: Image.asset(
                              "assets/images/delivery_app_logo.png")),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Text('L O G I N',
                          style:
                              TextStyle(fontSize: 30.sp, color: MyTheme.white)),
                    ),
                    SizedBox(
                      width: 250.w,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter Your Email',
                        prefixIcon: Icon(Icons.email_rounded),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {},
                    ),
                    verticalSpace(30.h),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                        prefixIcon: Icon(Icons.password_rounded),
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {},
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        var wid = MediaQuery.of(context).size.width * (3 / 4);
                        print(wid);
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                        );*/
                      },
                    ),
                    verticalSpace(20.h),
                    ElevatedButton(
                      child: const Text('Signup',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
