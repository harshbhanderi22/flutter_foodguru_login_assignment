import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodguru_login/Screens/welcome_screen.dart';
import '../Widget/wave_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final size = MediaQuery.of(context).size;
  late final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
  final _formkey = GlobalKey<FormState>();
  final _dialogeformkey = GlobalKey<FormState>();

  String emailtext="foodguru@gmail.com";
  String passwordtext="foodguru123";
  String forgotemailtext="";
  String newpassword="";
  String confirmpassword="";

  bool passworvisible=true;
  bool newpasswordvisible=false;
  bool loginvisible=true;
  bool submitvisible=false;
  bool forgottextvisible=true;
   bool emailvisible=true;
  bool forgotemailvisible=false;

  String loginlabel="Login";
  String forgotlabel="Forgot Password?";

  String spemail="foodguru@gmail.com";
  String sppassword="foodguru123";

  @override
  void initState()  {
    shared();
  }

  void shared() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString("email", spemail);
    prefs.setString("password", sppassword);
      emailtext = (await prefs.getString("email"))!;
      passwordtext = (await prefs.getString("password"))!;

  }

  void moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      await Future.delayed(Duration(seconds: 1));
      await Navigator.push(context, MaterialPageRoute(builder: (context) {
        return Welcome(spemail);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height - 200,
              color: Colors.blue,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutQuad,
              top: keyboardOpen ? -size.height / 3.7 : 0.0,
              child: WaveWidget(
                size: size,
                yOffset: size.height / 3.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 150, left: 160),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350, left: 50, right: 50),
              child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: forgotemailvisible ?  "$forgotemailtext": "$emailtext",
                        onChanged: (value){
                          setState((){
                            forgotemailvisible ? forgotemailtext=value :
                            emailtext=value;
                          });
                        },
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
                        validator: (value){
                          if(value!.isEmpty)
                          {
                             return "Email cannot be Empty";
                          }
                          if(value!="$spemail")
                            {
                              return "Email is incorrect";
                            }
                          else
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      Visibility(
                        visible: passworvisible,
                        child: TextFormField(
                          initialValue: passwordtext,
                             onChanged: (value){
                            setState((){
                              passwordtext=value;
                            });
                          },
                          obscureText: true,

                          decoration: InputDecoration(

                            icon: Icon(CupertinoIcons.lock),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.greenAccent, width: 1.5),
                                borderRadius: BorderRadius.circular(15.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.5),
                                borderRadius: BorderRadius.circular(15.0)),
                            hintText: "Password",
                            label: Text("Password"),
                          ),
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return "Password cannot be empty";
                            }
                            if(value.length<8)
                            {
                              return "Password length should be atleast 8";
                            }
                            if(value!="$sppassword")
                            {
                              return "Password is incorrect";
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: forgottextvisible,
              child: Padding(
                padding: EdgeInsets.only(top: 530),
                child: Center(
                  child: RawMaterialButton(
                    onPressed: (){
                      setState((){
                        newpasswordvisible=true;
                        passworvisible=false;
                        loginvisible=false;
                        submitvisible=true;
                        forgottextvisible=false;
                        forgotemailvisible=true;
                      });
                    },
                    child: Text("$forgotlabel",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: loginvisible,
              child: Padding(
                padding: const EdgeInsets.only(top: 590),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 40), elevation: 10.0),
                    onPressed: () => moveToHome(context),
                    child:  Text(
                      "$loginlabel",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: submitvisible,
              child: Padding(
                padding: const EdgeInsets.only(top: 500),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(150, 40), elevation: 10.0),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                                _showMyDialog();
                    }

                    },
                    child:  Text(
                      "Submit",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Set Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children:   <Widget>[
                Form(
                  key: _dialogeformkey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value){
                          newpassword=value;
                        },
                        decoration: InputDecoration(
                          icon: Icon(CupertinoIcons.lock),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "New Password",
                          label: Text("New Password"),

                        ),
                        validator: (value){
                          if(newpassword.isEmpty)
                          {
                            return "New Password cannot be empty";
                          }
                          else if(newpassword.length<8)
                          {
                            return "Password length should be atleast 8";
                          }
                          else
                          {
                            null;
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        onChanged: (value){
                          confirmpassword=value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(CupertinoIcons.lock),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.greenAccent, width: 1.5),
                              borderRadius: BorderRadius.circular(15.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.grey, width: 1.5),
                              borderRadius: BorderRadius.circular(15.0)),
                          hintText: "Confirm Password",
                          label: Text("Confirm Password"),
                        ),
                        validator: (value){
                          if(confirmpassword.isEmpty)
                            {
                              return "Confirm Password cannot be empty";
                            }
                          else if(confirmpassword !=newpassword)
                            {
                              return "Password doesn't match";
                            }
                          else
                            {
                              null;
                            }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: ()  {
                  if(_dialogeformkey.currentState!.validate()){
                    setState((){
                      sppassword=confirmpassword;
                      passwordtext=confirmpassword;
                      passworvisible=true;
                      loginvisible=true;
                      submitvisible=false;
                      forgottextvisible=true;
                      forgotemailvisible=false;
                    });
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
