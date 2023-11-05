import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/Components/app_theme.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //final ScrollController _scrollController = ScrollController();
  final ScrollController _xcrollController = ScrollController();

  //List<Sortable> _datewiseSortList = Sortable.getDatewiseSortList();
  //List<Sortable> _paymentTypeSortList = Sortable.getPaymentTypeSortList();
  //late Sortable _selectedDate;
  //late Sortable _selectedPaymentType;
  //late List<DropdownMenuItem<Sortable>> _dropdownDatewiseSortItems;
  //late List<DropdownMenuItem<Sortable>> _dropdownPaymentTypeSortItems;
  //init

  final List<dynamic> _list = [];
  // final bool _isInitial = true;
  // final int _page = 1;
  final int _totalData = 0;
  final bool _showLoadingContainer = false;
  final String todayDate = ". . .";
  final String yesterdayDate = ". . .";
  final String todayEarning = ". . .";
  final String yesterdayEarning = ". . .";

  // String _defaultDateKey = '';
  // String _defaultPaymentTypeKey = '';

  Future<void> _onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(context),
          key: _scaffoldKey,
          //drawer: MainDrawer(),
          body: Stack(
            children: [
              RefreshIndicator(
                color: MyTheme.accent_color,
                backgroundColor: Colors.white,
                onRefresh: _onRefresh,
                displacement: 0,
                child: CustomScrollView(
                  controller: _xcrollController,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        buildList(),
                        Container(
                          height: 100,
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Align(alignment: Alignment.center, child: buildLoadingContainer())
            ],
          )),
    );
  }

  buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(200.w),
      child: Column(
        children: [
          buildTopAppBarContainer(),
          buildBottomAppBar(context)
          // AppBar(
          //     centerTitle: false,
          //     backgroundColor: Colors.white,
          //     automaticallyImplyLeading: false,
          //     actions: [
          //       new Container(),
          //     ],
          //     elevation: 0.0,
          //     titleSpacing: 0,
          //     flexibleSpace: Padding(
          //       padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
          //       child: Column(
          //         children: [
          //           Padding(
          //             padding: MediaQuery.of(context).viewPadding.top >
          //                     30 //MediaQuery.of(context).viewPadding.top is the statusbar height, with a notch phone it results almost 50, without a notch it shows 24.0.For safety we have checked if its greater than thirty
          //                 ? const EdgeInsets.only(top: 36.0)
          //                 : const EdgeInsets.only(top: 14.0),
          //             child: buildTopAppBarContainer(),
          //           ),
          //           buildBottomAppBar(context)
          //         ],
          //       ),
          //     )),
        ],
      ),
    );
  }

  buildTopAppBarContainer() {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      centerTitle: false,
      backgroundColor: MyTheme.white,
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Image.asset("assets/images/hamburger.png",
                height: 16, color: MyTheme.grey_153)),
      ),
      title: Text('Earnings',
          style: TextStyle(fontSize: 16.sp, color: MyTheme.accent_color)),
    );

    // Row(
    //   children: [
    //     // widget.show_back_button
    //     //     ? Builder(
    //     //         builder: (context) => IconButton(
    //     //             icon: Icon(Icons.arrow_back, color: MyTheme.dark_grey),
    //     //             onPressed: () {
    //     //               return Navigator.of(context).pop();
    //     //             }),
    //     //       )
    //     //     :
    //     Builder(
    //       builder: (context) => GestureDetector(
    //         onTap: () {
    //           _scaffoldKey.currentState!.openDrawer();
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(
    //               vertical: 18.0, horizontal: 12.0),
    //           child: Container(
    //             child: Image.asset(
    //               'assets/images/hamburger.png',
    //               height: 16,
    //               //color: MyTheme.dark_grey,
    //               color: MyTheme.dark_grey,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //     Text(
    //       "Earnings",
    //       style: TextStyle(fontSize: 16, color: MyTheme.accent_color),
    //     ),
    //   ],
    // );
  }

  buildBottomAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0, left: 12.w, right: 5.w),
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
                    borderRadius: BorderRadius.all(Radius.circular(8.r))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
                        child: Text("Today",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Text(todayEarning,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(todayDate,
                          style: const TextStyle(color: Colors.white)),
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
                  borderRadius: BorderRadius.all(Radius.circular(8.r))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0, bottom: 16.0),
                      child: Text(
                        "Yesterday",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      child: Text(yesterdayEarning,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text(yesterdayDate,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildList() {
    // if (_isInitial && _list.length == 0) {
    //   return SingleChildScrollView(
    //       child: ShimmerHelper()
    //           .buildListShimmer(item_count: 5, item_height: 100.0));
    // } else

    if (_list.isNotEmpty) {
      return SingleChildScrollView(
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: _list.length,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return OrderDetails(
                    //     id: _list[index].order_id,
                    //   );
                    // }));
                  },
                  child: buildListItem(index),
                ));
          },
        ),
      );
    } else if (_totalData == 0) {
      return const Center(child: Text("No data is available"));
    } else {
      return Container(); // should never be happening
    }
  }

  buildListItem(int index) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: MyTheme.light_grey, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    _list[index].order_code,
                    style: TextStyle(
                        color: MyTheme.grey_153,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Row(
                    children: [
                      Text(_list[index].date,
                          style: TextStyle(
                              color: MyTheme.font_grey, fontSize: 13)),
                      const Spacer(),
                      Text(
                        _list[index].earning,
                        style: TextStyle(
                            color: MyTheme.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildLoadingContainer() {
    return Container(
      height: _showLoadingContainer ? 36 : 0,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(_totalData == _list.length
            ? "No More Items"
            : "Loading More Items ..."),
      ),
    );
  }
}
