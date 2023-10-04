// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:login_app/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontSize: 35, color: Colors.lightBlueAccent),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter Your Email',
                          prefixIcon: Icon(Icons.email_rounded),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {},
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Please enter your Email'
                              : null;
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Your Password',
                          prefixIcon: Icon(Icons.password_rounded),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {},
                        validator: (value) {
                          return value!.isEmpty
                              ? 'Please enter Password'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
                      child: ElevatedButton(
                        child: Text('Login', style: TextStyle(fontSize: 20, color: Colors.white),),
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Homepage()),
                          );
                        },
                      ),
                    )
                  ],
                ),

            ),
          ],
        ),
      ),
    );
  }
}
