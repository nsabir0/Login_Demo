import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_app/Components/app_theme.dart';
import 'package:login_app/Components/input_decorations.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final ScrollController _mainScrollController = ScrollController();

  //TextEditingController _nameController = TextEditingController(text: "${user_name.$}");
  final TextEditingController _nameController =
      TextEditingController(text: "TextEditingController");
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double mHeight = 0, mWidth = 0;

  Future<void> _onPageRefresh() async {}
  //for image uploading
  //late File _file;

  @override
  Widget build(BuildContext context) {
    mHeight = MediaQuery.of(context).size.height;
    mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      //drawer: MainDrawer(),
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: buildBody(context),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: MyTheme.white,
      centerTitle: true,
      leading: GestureDetector(
        child: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 0.0),
              child: Image.asset('assets/images/hamburger.png',
                  height: 16, color: MyTheme.dark_grey),
            ),
          ),
        ),
      ),
      title: Text("Account",
          style: TextStyle(fontSize: 16, color: MyTheme.accent_color)),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }

  buildBody(context) {
    // var is_logged_in = true;
    // if (is_logged_in.$ == false) {
    //   return Container(
    //       height: 100,
    //       child: Center(
    //           child: Text("Please log in to see the profile",
    //               style: TextStyle(color: MyTheme.font_grey))));
    // } else {
    //   return
    // }

    return RefreshIndicator(
      displacement: 10,
      color: MyTheme.red,
      backgroundColor: Colors.white,
      onRefresh: _onPageRefresh,
      child: CustomScrollView(
        controller: _mainScrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              buildTopSection(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  height: 24,
                ),
              ),
              buildProfileForm(context)
            ]),
          )
        ],
      ),
    );
  }

  buildTopSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
          child: Stack(
            children: [
              CircleAvatar(
                  radius: 60, child: Image.asset('assets/images/profile.png')

                  // width: 120,
                  // height: 120,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(100),
                  //   border: Border.all(
                  //       color: const Color.fromRGBO(112, 112, 112, .3), width: 2),
                  //   //shape: BoxShape.rectangle,
                  // ),
                  // child: ClipRRect(
                  //     clipBehavior: Clip.hardEdge,
                  //     borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  //     child: FadeInImage.assetNetwork(
                  //       placeholder: 'assets/images/profile.png',
                  //       image: "assets/images/profile.png",
                  //       //image: "${avatar_original.$}",
                  //       fit: BoxFit.fill,
                  //     )),
                  ),
              Positioned(
                right: 8,
                bottom: 8,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: MaterialButton(
                    color: MyTheme.light_grey,
                    padding: const EdgeInsets.all(0),
                    shape: CircleBorder(
                      side: BorderSide(color: MyTheme.light_grey, width: 1.0),
                    ),
                    onPressed: () {
                      //chooseAndUploadImage(context);
                    },
                    child: Icon(Icons.edit, color: MyTheme.font_grey, size: 14),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  buildProfileForm(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 16.0, right: 16.0, top: 8.0, bottom: mHeight > 600 ? 0 : 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              "Basic Information",
              style: TextStyle(
                  color: MyTheme.grey_153,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              "Name",
              style: TextStyle(color: MyTheme.red, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              height: 36,
              child: TextField(
                controller: _nameController,
                autofocus: false,
                decoration: InputDecorations.buildInputDecoration_1(
                    hintText: "John Doe"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              "Password",
              style: TextStyle(color: MyTheme.red, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 36,
                  child: TextField(
                    controller: _passwordController,
                    autofocus: false,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecorations.buildInputDecoration_1(
                        hintText: "• • • • • • • •"),
                  ),
                ),
                Text(
                  "Password must be at least 6 character",
                  style: TextStyle(
                      color: MyTheme.textfield_grey,
                      fontStyle: FontStyle.italic),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              "Retype Password",
              style: TextStyle(color: MyTheme.red, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SizedBox(
              height: 36,
              child: TextField(
                controller: _passwordConfirmController,
                autofocus: false,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecorations.buildInputDecoration_1(
                    hintText: "• • • • • • • •"),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Container(
                  height: 36.w,
                  width: 120.w,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: MyTheme.textfield_grey, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                  child: MaterialButton(
                    color: MyTheme.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: Text("Update Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      //onPressUpdate();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
