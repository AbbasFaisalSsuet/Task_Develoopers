// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:task_develoopers/homeScreen.dart';

class OTPControll extends StatefulWidget {
  final String phone;
  final String codeDigits;

  // ignore: prefer_const_constructors_in_immutables
  OTPControll({required this.phone, required this.codeDigits});

  @override
  _OTPControllState createState() => _OTPControllState();
}

class _OTPControllState extends State<OTPControll> {
  final GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? verificationCode;

  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.blueAccent,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      ));

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }

  verifyPhoneNumber() async {
    FirebaseAuth.instance.verifyPhoneNumber(
      // ignore: unnecessary_string_interpolations
      phoneNumber: "${widget.codeDigits + widget.phone}",
      verificationCompleted: (PhoneAuthCredential credential) {
        FirebaseAuth.instance.signInWithCredential(credential).then((value) {
          if (value.user != null) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (c) => Home()));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message.toString()),
          duration: Duration(seconds: 3),
        ));
      },
      codeSent: (String vID, int? resentToken) {
        setState(() {
          verificationCode = vID;
        });
      },
      codeAutoRetrievalTimeout: (String vID) {
        setState(() {
          verificationCode = vID;
        });
      },
      timeout: Duration(seconds: 60),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKey,
      appBar: AppBar(
        title: const Center(child: Text('OTP Verification')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.all(20.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  verifyPhoneNumber();
                },
                child: Text(
                  "Verifying: ${widget.codeDigits}-${widget.phone}",
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinOTPCodeFocus,
              controller: _pinOTPController,
              submittedFieldDecoration: pinOTPCodeDecoration,
              selectedFieldDecoration: pinOTPCodeDecoration,
              followingFieldDecoration: pinOTPCodeDecoration,
              pinAnimationType: PinAnimationType.rotation,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode!, smsCode: pin))
                      .then((value) {
                    if (value.user != null) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (c) => Home()));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid OTP'),
                    duration: Duration(seconds: 3),
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
