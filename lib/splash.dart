import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prep/home_page.dart';
import 'package:shared_prep/login_page.dart';

// ignore: camel_case_types
class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const login_page(),
          ));
    });
    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool islogin = sp.getBool("islogin") ?? false;
    if (islogin) {
      Timer(Duration(seconds: 5), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomPage(),
            ));
      });
    } else {
      Timer(Duration(seconds: 5), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => login_page(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(children: []),
      ),
    );
  }
}
