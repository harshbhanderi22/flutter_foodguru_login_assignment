import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widget/wave_widget.dart';

class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  late final size = MediaQuery.of(context).size;
  late final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 160, left: 70),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 400, left: 50, right: 50),
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(CupertinoIcons.mail),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Email",
                          label: Text("Email"),
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return "Email cannot be Empty";
                          }
                          else
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      // TextFormField(
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     icon: Icon(CupertinoIcons.lock),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //             color: Colors.greenAccent, width: 1.5),
                      //         borderRadius: BorderRadius.circular(15.0)),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderSide:
                      //         BorderSide(color: Colors.grey, width: 1.5),
                      //         borderRadius: BorderRadius.circular(15.0)),
                      //     hintText: "Password",
                      //     label: Text("Password"),
                      //   ),
                      //   validator: (value) {
                      //     if(value!.isEmpty)
                      //     {
                      //       return "Password cannot be empty";
                      //     }
                      //     if(value.length<8)
                      //     {
                      //       return "Password length should be atleast 8";
                      //     }
                      //     else
                      //     {
                      //       return null;
                      //     }
                      //   },
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(top: 540),
            //   child: Center(
            //     child: Text(
            //       "Forgot Password?",
            //       style: TextStyle(
            //           fontSize: 20.0,
            //           color: Colors.blueAccent,
            //           decoration: TextDecoration.underline),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 500),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 40), elevation: 10.0),
                  onPressed: () {

                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
