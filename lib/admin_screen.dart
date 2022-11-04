import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_page.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
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
        title: const Text("Admin"),
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
                Text(email.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Age ="),
                Text(age.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Role is = "),
                Text(deafultvalue.toString()),
              ],
            ),
            InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const login_page()));
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.red,
                    child: const Center(child: Text("logout"))))
          ],
        ),
      ),
    );
  }
}
