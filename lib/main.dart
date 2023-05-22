import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:testde/widget/glassEffectWidget.dart';

import 'otpScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: LoginSimple(),
    );
  }
}

class LoginSimple extends StatefulWidget {
  LoginSimple({Key? key}) : super(key: key);

  @override
  _LoginSimpleState createState() => _LoginSimpleState();
}

class _LoginSimpleState extends State<LoginSimple> {
  apiCall() async {
    try {
      final response = await post(
        Uri.parse("https://test-otp-api.7474224.xyz/sendotp.php"),
      );
      final responseJson = jsonDecode(response.body);
      debugPrint("Api response++:$responseJson");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  TextEditingController phoneNumber = TextEditingController();
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
                  "Get Started ",
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
                                GlassEffect(
                                  width: width / 1,
                                  borderRadius: 10.0,
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: IntlPhoneField(
                                        controller: phoneNumber,
                                        decoration: InputDecoration(
                                          hintText: 'Phone Number',
                                          helperStyle:
                                              TextStyle(color: Colors.white),
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          enabledBorder: InputBorder.none,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                          ),
                                        ),
                                        showDropdownIcon: false,
                                        initialCountryCode: 'IN',
                                        onChanged: (phone) {
                                          print(phone.completeNumber);
                                        },
                                      )),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (phoneNumber.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('Enter Data')));
                                    } else {
                                      apiCall();
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OtpScreen()));
                                    }
                                  },
                                  child: GlassEffect(
                                    width: width / 1,
                                    height: 50,
                                    borderRadius: 10.0,
                                    child: Center(child: Text("Continue")),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
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
/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget _buildMobileNumberWithCountryCode() {
      return IntlPhoneField(
        decoration: InputDecoration(
          labelText: 'Phone Number',
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        initialCountryCode: 'IN',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Get Started",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            _buildMobileNumberWithCountryCode()
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
