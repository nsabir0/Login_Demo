import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:login_app/Components/app_theme.dart';
import 'package:login_app/Components/input_decorations.dart';
import 'package:login_app/Config/addon_config.dart';
import 'package:login_app/View/main_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String loginBy = "email"; //phone or email
  String initialCountry = 'US';
  PhoneNumber phoneCode = PhoneNumber(isoCode: 'US', dialCode: "+1");
  //String _phone = "";

  //controllers
  //final TextEditingController _phoneNumberController = TextEditingController();
  //final TextEditingController _emailController = TextEditingController();
  //final TextEditingController _passwordController = TextEditingController();

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
                    //==================Logo and Intro=================================
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

                    //==================LogIn Box===============================
                    SizedBox(
                      width: 250.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //==================EmailField=================================
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              loginBy == "email" ? "Email" : "Phone",
                              style: TextStyle(
                                  color: MyTheme.golden,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          if (loginBy == "email")
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 36,
                                    child: TextFormField(
                                      autofocus: false,
                                      keyboardType: TextInputType.emailAddress,
                                      style: const TextStyle(
                                          color: Colors.white70),
                                      decoration: InputDecorations
                                          .buildInputDecoration_1(
                                              hintText: "johndoe@example.com"),
                                      onChanged: (value) {},
                                    ),
                                  ),
                                  //==================Login with phone field=================================
                                  AddonConfig.otpAddonInstalled
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              loginBy = "email";
                                            });
                                          },
                                          child: Text(
                                            "or, Login with a phone number",
                                            style: TextStyle(
                                                color: MyTheme.golden,
                                                fontStyle: FontStyle.italic,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),

                          //=================Phone field========================
                          //   else
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 8.0),
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.end,
                          //     children: [
                          //       SizedBox(
                          //         height: 36,
                          //         child: CustomInternationalPhoneNumberInput(
                          //           textFieldController: _phoneNumberController,
                          //           onInputChanged: (PhoneNumber number) {
                          //             print(number.phoneNumber);
                          //             setState(() {
                          //               _phone = number.phoneNumber!;
                          //             });
                          //           },
                          //           onInputValidated: (bool value) {
                          //             print('on input validation $value');
                          //           },
                          //           selectorConfig: const SelectorConfig(
                          //             selectorType: PhoneInputSelectorType.DIALOG,
                          //           ),
                          //           ignoreBlank: false,
                          //           autoValidateMode: AutovalidateMode.disabled,
                          //           selectorTextStyle:
                          //               TextStyle(color: MyTheme.font_grey),
                          //           textStyle: const TextStyle(color: Colors.white54),
                          //           initialValue: phoneCode,
                          //           formatInput: true,
                          //           keyboardType: const TextInputType.numberWithOptions(
                          //               signed: true, decimal: true),
                          //           inputDecoration: InputDecorations
                          //               .buildInputDecorationPhone(
                          //                   hintText: "01710 333 558"),
                          //           onSaved: (PhoneNumber number) {
                          //             print('On Saved: $number');
                          //           },
                          //         ),
                          //       ),
                          //       GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             loginBy = "email";
                          //           });
                          //         },
                          //         child: Text(
                          //           "or, Login with an email",
                          //           style: TextStyle(
                          //               color: MyTheme.golden,
                          //               fontStyle: FontStyle.italic,
                          //               decoration: TextDecoration.underline),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),

                          //==================PasswordField==========================================
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: MyTheme.golden,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 36,
                                  child: TextFormField(
                                    autofocus: false,
                                    obscureText: true,
                                    enableSuggestions: false,
                                    autocorrect: false,
                                    style:
                                        const TextStyle(color: Colors.white70),
                                    decoration:
                                        InputDecorations.buildInputDecoration_1(
                                            hintText: "• • • • • • • •"),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text("Forgot Password?",
                                      style: TextStyle(
                                          color: MyTheme.golden,
                                          fontStyle: FontStyle.italic,
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ],
                            ),
                          ),
                          //==================Login Button========================
                          Padding(
                            padding: EdgeInsets.only(top: 30.h),
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyTheme.textfield_grey, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.r))),
                              child: MaterialButton(
                                minWidth: double.infinity,
                                //height: 50,
                                color: MyTheme.golden,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(12.r))),
                                child: const Text("LOGIN",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                onPressed: () {
                                  //onPressedLogin();
                                  Get.to(() => const MainPage());
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //==================Information Text=================================
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        "If you are finding any problem while logging in ",
                        style:
                            TextStyle(fontSize: 14, color: Colors.cyanAccent),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                      ),
                      child: Text(
                        "please contact the admin",
                        style:
                            TextStyle(fontSize: 14, color: Colors.cyanAccent),
                      ),
                    ),

                    // ElevatedButton(
                    //   child: const Text('Signup',
                    //       style: TextStyle(fontSize: 20, color: Colors.white)),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const Signup()),
                    //     );
                    //   },
                    // ),
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
