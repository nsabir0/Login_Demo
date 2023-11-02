import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/Components/app_theme.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1({hintText = ""}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.0, color: MyTheme.grey_153),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.grey_153, width: 1.w),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.grey_153, width: 1.5.w),
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        contentPadding: EdgeInsets.only(left: 16.w));
  }

  static InputDecoration buildInputDecorationPhone({hintText = ""}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: MyTheme.textfield_grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.textfield_grey, width: 0.5.w),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.r),
              bottomRight: Radius.circular(5.r)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.textfield_grey, width: 1.w),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.r),
                bottomRight: Radius.circular(5.r))),
        contentPadding: EdgeInsets.only(left: 16.w));
  }
}
