import 'package:flutter/material.dart';
import 'package:login_app/Screens/home_page.dart';
import 'package:login_app/Screens/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Login Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 35, color: Colors.lightBlueAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
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
                  const SizedBox(
                    height: 30,
                  ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 30),
                    child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text('Signup',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Signup()),
                      );
                    },
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
