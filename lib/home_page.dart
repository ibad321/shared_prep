// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prep/login_page.dart';

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  String email = "";
  String age = "";
  String deafultvalue = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    email = sp.getString("Email") ?? "";
    age = sp.getString("Age") ?? "";
    deafultvalue = sp.getString("type") ?? "";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text("Email ="),
                Text(
                  email.toString(),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Age ="),
                Text(
                  age.toString(),
                ),
              ],
            ),
            Row(
              children: [
                const Text("Role ="),
                Text(
                  deafultvalue.toString(),
                )
              ],
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const login_page(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.red,
                child: const Center(
                  child: Text("logout"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
