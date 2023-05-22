import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testde/homeScreen.dart';
import 'package:testde/widget/glassEffectWidget.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
          backgroundColor: Colors.blueGrey,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned(
                top: 50.0,
                left: 15.0,
                right: 15.0,
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 10,
                      fontWeight: FontWeight.w700),
                ),
              ),
              // WrGlassMorphism(),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: width / 8.9, right: width / 8.9),
                    child: Column(
                      children: [
                        GlassEffect(
                          borderRadius: 10.0,
                          borderwidth: 2.0,
                          blur: 15.0,
                          bgcolor: Color(0xFFFFFFFF),
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: width / 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Looks like you are new here. Tell us a bit about yourself",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                GlassEffect(
                                  width: width / 1,
                                  height: 50,
                                  borderRadius: 10.0,
                                  child: TextField(
                                    controller: nameController,
                                    cursorColor: Colors.white,
                                    cursorRadius: Radius.circular(30),
                                    decoration: InputDecoration(
                                      hintText: "Name",
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintStyle: TextStyle(color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                GlassEffect(
                                  width: width / 1,
                                  height: 50,
                                  borderRadius: 10.0,
                                  child: TextField(
                                    controller: emailController,
                                    cursorColor: Colors.white,
                                    cursorRadius: Radius.circular(30),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 10),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen(
                                                name: nameController.text,
                                                email: emailController.text)));
                                  },
                                  child: GlassEffect(
                                    width: width / 2,
                                    height: 50,
                                    borderRadius: 10.0,
                                    child: Center(
                                        child: Text(
                                      "Submit",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
