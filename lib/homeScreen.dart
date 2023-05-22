import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testde/widget/glassEffectWidget.dart';

class HomeScreen extends StatefulWidget {
  final String name, email;
  const HomeScreen({required this.name, required this.email});
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
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
                  "Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 10,
                      fontWeight: FontWeight.w700),
                ),
              ),
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
                                    "Your profile",
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
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Name:${widget.name}")),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                GlassEffect(
                                  width: width / 1,
                                  height: 50,
                                  borderRadius: 10.0,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Email:${widget.email}")),
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
