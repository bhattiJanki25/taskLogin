import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:http/http.dart';
import 'package:testde/welcomeScreen.dart';
import 'package:testde/widget/glassEffectWidget.dart';

class OtpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OtpScreenState();
  }
}

class OtpScreenState extends State<OtpScreen> {
  apiCall() async {
    try {
      final response = await post(
        Uri.parse("https://test-otp-api.7474224.xyz/verifyotp.php"),
      );
      final responseJson = jsonDecode(response.body);
      debugPrint("Api response++:$responseJson");
    } catch (e) {
      debugPrint(e.toString());
    }
  }

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
                    "Enter OTP ",
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
                      padding: EdgeInsets.only(
                          left: width / 8.9, right: width / 8.9),
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
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: OtpTextField(
                                      numberOfFields: 5,
                                      borderColor: Color(0xFF512DA8),
                                      //set to true to show as box or false to show as dash
                                      showFieldAsBox: true,
                                      //runs when a code is typed in
                                      onCodeChanged: (String code) {
                                        //handle validation or checks here
                                      },
                                      //runs when every textfield is filled
                                      onSubmit: (String
                                          verificationCode) {}, // end onSubmit
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      apiCall();
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomeScreen()));
                                    },
                                    child: GlassEffect(
                                      width: width / 2,
                                      height: 50,
                                      borderRadius: 10.0,
                                      child: Center(child: Text("verify")),
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
            )));
  }
}
