import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentSize= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('HOMEPAGE'),
        centerTitle: true,
      ),

      body: Column(
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
                fontSize: 14.h,
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
          SizedBox(height: 25.h,),

        ],
      ),
    );
  }
}
