import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  Widget getTextfield({required String hint}){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.transparent, width: 0),
            ),
            filled: true,
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            )
        ),
      ),
    );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('HOMEPAGE'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text ('SignUp to MediaSoft',
                style: TextStyle(
                    fontSize: 18.sp,
                color: Colors.black54),
              ),
              SizedBox(height: 4.h,),
              Row(
                children: [
                  Text('Already have an Account?',
                    style: TextStyle(
                    fontSize: 15.h,
                    color: Colors.black54
                  ),
                  ),
                  Text('Login',
                    style: TextStyle(
                        fontSize: 14.h,
                        color: Colors.lightBlue
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h,),
              getTextfield(hint: "Full Name"),
              SizedBox(height: 16.h,),
              getTextfield(hint: "Email"),
              SizedBox(height: 16.h,),
              getTextfield(hint: "Password"),
              SizedBox(height: 16.h,),
              getTextfield(hint: "Confirm Password"),


            ],
          ),
        ),
      ),
    );
  }
}
