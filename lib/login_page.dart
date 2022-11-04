import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prep/admin_screen.dart';
import 'package:shared_prep/home_page.dart';
import 'package:shared_prep/studen_screen.dart';
import 'package:shared_prep/teachear_screen.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();

  String deafultvalue = "Teacher";

  List<String> items = <String>[
    "Student",
    "Teacher",
    "Admin",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'PAssword',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: agecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Age',
              ),
            ),
            DropdownButton<String>(
              value: deafultvalue,
              items: items.map((String option) {
                return DropdownMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  deafultvalue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('Email', emailcontroller.text.toString());
                  sp.setString('Age', agecontroller.text.toString());
                  sp.setBool("islogin", true);
                  sp.setString("type", deafultvalue);

                  if (deafultvalue == 'Student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const student_screen()));
                  } else if (deafultvalue == 'Teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const teachear_screen()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyWidget()));
                  }
                },
                child: Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.red,
                    child: const Center(child: Text("Click"))))
          ],
        ),
      ),
    );
  }
}
