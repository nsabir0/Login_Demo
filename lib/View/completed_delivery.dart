import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/Components/app_theme.dart';

class CompletedDelivery extends StatelessWidget {
  const CompletedDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: MyTheme.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(200.w),
            child: Column(
              children: [
                AppBar(
                  elevation: 0,
                  backgroundColor: MyTheme.white,
                  titleSpacing: 0,
                  centerTitle: true,
                  title: Text('My deliveries',
                      style: TextStyle(
                          fontSize: 16.sp, color: MyTheme.accent_color)),
                  leading: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Image.asset("assets/images/hamburger.png",
                          height: 16, color: MyTheme.grey_153)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0, left: 12.w, right: 4),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            height: 105.w,
                            width: 200,
                            decoration: BoxDecoration(
                                color: MyTheme.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r))),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 4.0, bottom: 16.0),
                                    child: Text(
                                      "Today",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2.0),
                                    child: Text(
                                      'Earning',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 105.w,
                          width: 200,
                          decoration: BoxDecoration(
                              color: MyTheme.grey_153,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 4.0, bottom: 16.0),
                                  child: Text(
                                    "Yesterday",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2.0),
                                  child: Text(
                                    'Earning',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Text(
                                  'Date',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        bottomNavigationBar: buildBottomNavBar(context),
      ),
    );
  }

  buildBottomNavBar(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return BottomAppBar(
        child: Container(
          color: Colors.transparent,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                splashColor: Colors.transparent,
                minWidth: MediaQuery.of(context).size.width / 2 - .5,
                height: 50,
                color: MyTheme.lime_disabled,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                          height: 16,
                          width: 16,
                          child: Image.asset(
                            "assets/images/delivery_moving.png",
                            color: Colors.white,
                          )),
                    ),
                    const Text(
                      "Completed Delivery",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 1,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2 - .5,
                height: 50,
                color: MyTheme.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                          height: 14,
                          width: 14,
                          child: Image.asset("assets/images/clock.png",
                              color: Colors.white)),
                    ),
                    const Text("Pending Delivery",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return Pending();
                  // })).then((value) {
                  //   onPop(value);
                  // });
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
