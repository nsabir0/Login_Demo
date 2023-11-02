import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/Components/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _mainScrollController = ScrollController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //init
  String completeDelivery = ". . .";
  String pendingDelivery = ". . .";
  String totalCollection = ". . .";
  String totalEarning = ". . .";
  String _cancelled = ". . .";
  String onTheWay = ". . .";
  String _picked = ". . .";
  String _assigned = ". . .";

  double mHeight = 0, mWidth = 0;

  Future<void> _onPageRefresh() async {
    reset();
    //fetchSummary();
  }

  reset() {
    completeDelivery = ". . .";
    pendingDelivery = ". . .";
    totalCollection = ". . .";
    totalCollection = ". . .";
    _cancelled = ". . .";
    onTheWay = ". . .";
    _picked = ". . .";
    _assigned = ". . .";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: buildAppBar(context),
        key: _scaffoldKey,
        //drawer: MainDrawer(),
        body: buildBody(context),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: Builder(
          builder: (context) => Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
            child: Image.asset(
              "assets/images/hamburger.png",
              height: 16,
              //color: MyTheme.dark_grey,
              color: MyTheme.grey_153,
            ),
          ),
        ),
      ),
      title: const Text(
        "Dashboard",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      elevation: 0.0,
      titleSpacing: 0,
      backgroundColor: const Color.fromRGBO(39, 38, 43, 1),
      actions: const <Widget>[],
    );
  }

  buildBody(context) {
    return RefreshIndicator(
      color: MyTheme.accent_color,
      backgroundColor: Colors.white,
      onRefresh: _onPageRefresh,
      child: CustomScrollView(
        controller: _mainScrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              buildTopContainer(),
              buildSecondContainer(),
              buildHomeMenuRow(context)
            ]),
          ),
        ],
      ),
    );
  }

  buildTopContainer() {
    return SizedBox(
      width: double.infinity,
      height: 400.h,
      child: Padding(
          padding:
              EdgeInsets.only(top: 8.h, bottom: 16.h, left: 8.w, right: 8.w),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20.dg,
            mainAxisSpacing: 20.dg,
            shrinkWrap: true,
            childAspectRatio: 25 / 24,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return const CompletedDelivery(
                  //     show_back_button: true,
                  //   );
                  // })).then((value) {
                  //   onPop(value);
                  // });
                },
                child: Container(
                  //width: 140.w,
                  decoration: BoxDecoration(
                      color: MyTheme.lime,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/images/delivery_moving.png",
                              color: Colors.grey.shade300,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Completed Delivery",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(completeDelivery,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return Pending();
                  // })).then((value) {
                  //   onPop(value);
                  // });
                },
                child: Container(
                  //width: 140.w,
                  decoration: BoxDecoration(
                      color: MyTheme.red,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/images/clock.png",
                              color: Colors.grey.shade300,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Pending Delivery",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          pendingDelivery,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return Collection(
                  //     show_back_button: true,
                  //   );
                  // })).then((value) {
                  //   onPop(value);
                  // });
                },
                child: Container(
                  //width: 140.w,
                  decoration: BoxDecoration(
                      color: MyTheme.orange,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/images/delivery_moving.png",
                              color: Colors.grey.shade300,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Total Collected",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          totalCollection,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return Earnings(
                  //     show_back_button: true,
                  //   );
                  // })).then((value) {
                  //   onPop(value);
                  // });
                },
                child: Container(
                  //width: 140.w,
                  decoration: BoxDecoration(
                      color: MyTheme.blue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset(
                              "assets/images/dollar.png",
                              color: Colors.grey.shade300,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Earnings",
                          style: TextStyle(color: Colors.grey.shade300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          totalCollection,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (context) {
          //             //   return const CompletedDelivery(
          //             //     show_back_button: true,
          //             //   );
          //             // })).then((value) {
          //             //   onPop(value);
          //             // });
          //           },
          //           child: Container(
          //             width: 140.w,
          //             decoration: BoxDecoration(
          //                 color: MyTheme.lime,
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(12))),
          //             child: Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 24.0),
          //                   child: SizedBox(
          //                       height: 50,
          //                       width: 50,
          //                       child: Image.asset(
          //                         "assets/images/delivery_moving.png",
          //                         color: Colors.grey.shade300,
          //                       )),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     "Completed Delivery",
          //                     style: TextStyle(color: Colors.grey.shade300),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(completeDelivery,
          //                       style: const TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 24,
          //                           fontWeight: FontWeight.w600)),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (context) {
          //             //   return Pending();
          //             // })).then((value) {
          //             //   onPop(value);
          //             // });
          //           },
          //           child: Container(
          //             width: 140.w,
          //             decoration: BoxDecoration(
          //                 color: MyTheme.red,
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(12))),
          //             child: Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 24.0),
          //                   child: SizedBox(
          //                       height: 50,
          //                       width: 50,
          //                       child: Image.asset(
          //                         "assets/images/clock.png",
          //                         color: Colors.grey.shade300,
          //                       )),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     "Pending Delivery",
          //                     style: TextStyle(color: Colors.grey.shade300),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     pendingDelivery,
          //                     style: const TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 24,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         InkWell(
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (context) {
          //             //   return Collection(
          //             //     show_back_button: true,
          //             //   );
          //             // })).then((value) {
          //             //   onPop(value);
          //             // });
          //           },
          //           child: Container(
          //             width: 140.w,
          //             decoration: BoxDecoration(
          //                 color: MyTheme.orange,
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(12))),
          //             child: Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 24.0),
          //                   child: SizedBox(
          //                       height: 50,
          //                       width: 50,
          //                       child: Image.asset(
          //                         "assets/images/delivery_moving.png",
          //                         color: Colors.grey.shade300,
          //                       )),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     "Total Collected",
          //                     style: TextStyle(color: Colors.grey.shade300),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     totalCollection,
          //                     style: const TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 24,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //         InkWell(
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (context) {
          //             //   return Earnings(
          //             //     show_back_button: true,
          //             //   );
          //             // })).then((value) {
          //             //   onPop(value);
          //             // });
          //           },
          //           child: Container(
          //             width: 140.w,
          //             decoration: BoxDecoration(
          //                 color: MyTheme.blue,
          //                 borderRadius:
          //                     const BorderRadius.all(Radius.circular(12))),
          //             child: Column(
          //               children: [
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 24.0),
          //                   child: SizedBox(
          //                       height: 50,
          //                       width: 50,
          //                       child: Image.asset(
          //                         "assets/images/dollar.png",
          //                         color: Colors.grey.shade300,
          //                       )),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     "Earnings",
          //                     style: TextStyle(color: Colors.grey.shade300),
          //                   ),
          //                 ),
          //                 Padding(
          //                   padding: const EdgeInsets.only(top: 4.0),
          //                   child: Text(
          //                     totalCollection,
          //                     style: const TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 24,
          //                         fontWeight: FontWeight.w600),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),

          ),
    );
  }

  buildSecondContainer() {
    return InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return CancelledDelivery(show_back_button: true);
          // }));
        },
        child: Container(
          width: double.infinity,
          height: 70.h,
          color: MyTheme.red,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: SizedBox(
                  height: 28.h,
                  width: 28.w,
                  child: Image.asset(
                    "assets/images/cross_in_a_box.png",
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("Cancelled Delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 90.w),
                child: Text(_cancelled,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ));
  }

  buildHomeMenuRow(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 24.0, left: 16.0, right: 16.0, bottom: mHeight > 600 ? 0 : 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Pending(
              //     index: 0,
              //   );
              // })).then((value) {
              //   onPop(value);
              // });
            },
            child: Column(
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: MyTheme.red,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/human_run.png",
                        color: Colors.white,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "On The Way ($onTheWay)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: MyTheme.red,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Pending(
              //     index: 1,
              //   );
              // })).then((value) {
              //   onPop(value);
              // });
            },
            child: Column(
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: MyTheme.golden,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/press.png",
                        color: Colors.white,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Picked ($_picked)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: MyTheme.golden,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return Pending(
              //     index: 2,
              //   );
              // })).then((value) {
              //   onPop(value);
              // });
            },
            child: Column(
              children: [
                Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: MyTheme.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/images/sandclock.png",
                        color: Colors.white,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Assigned ($_assigned)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        color: MyTheme.blue,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

// Previous UI
// Scaffold(
//       appBar: AppBar(
//         title: const Text('HOMEPAGE'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'SignUp to MediaSoft',
//                 style: TextStyle(fontSize: 18.sp, color: Colors.black54),
//               ),
//               SizedBox(
//                 height: 4.h,
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'Already have an Account?',
//                     style: TextStyle(fontSize: 15.h, color: Colors.black54),
//                   ),
//                   Text(
//                     'Login',
//                     style: TextStyle(fontSize: 14.h, color: Colors.lightBlue),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 24.h,
//               ),
//               getTextfield(hint: "Full Name"),
//               SizedBox(
//                 height: 16.h,
//               ),
//               getTextfield(hint: "Email"),
//               SizedBox(
//                 height: 16.h,
//               ),
//               getTextfield(hint: "Password"),
//               SizedBox(
//                 height: 16.h,
//               ),
//               getTextfield(hint: "Confirm Password"),
//             ],
//           ),
//         ),
//       ),
//     );
//   Widget getTextfield({required String hint}) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: TextField(
//         decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.r),
//               borderSide: const BorderSide(color: Colors.transparent, width: 0),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8.r),
//               borderSide: const BorderSide(color: Colors.transparent, width: 0),
//             ),
//             filled: true,
//             hintText: hint,
//             hintStyle: TextStyle(
//               fontSize: 14.sp,
//               fontWeight: FontWeight.w400,
//             )),
//       ),
//     );
//   }
}
