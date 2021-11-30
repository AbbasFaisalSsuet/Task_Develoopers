// ignore_for_file: prefer_const_constructors

import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_develoopers/homeScreen.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  bool submitValid = false;

  final TextEditingController _emailController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _OTPControl = TextEditingController();

  late EmailAuth emailAuth;

  void verify() {
    // ignore: avoid_print
    print(emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _OTPControl.value.text));
  }

  sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Home(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       // ignore: prefer_const_constructors
      //       SizedBox(
      //         height: 200.0,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.all(10.0),
      //         child: const Center(
      //           child: Text(
      //             'Email OTP Verfication',
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               fontSize: 30.0,
      //             ),
      //           ),
      //         ),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(16.0),
      //         child: Column(
      //           children: [
      //             TextField(
      //               controller: _emailController,
      //               keyboardType: TextInputType.emailAddress,
      //               decoration: const InputDecoration(
      //                 hintText: "Enter Email",
      //                 labelText: "Email",
      //                 // suffixIcon: TextButton(
      //                 //   child: Text('Send OTP'),
      //                 // ),
      //               ),
      //             ),
      //             const SizedBox(height: 30.0),
      //             TextField(
      //               controller: _OTPControl,
      //               keyboardType: TextInputType.number,
      //               obscureText: true,
      //               decoration: const InputDecoration(
      //                 hintText: "Enter OTP",
      //                 labelText: "OTP",
      //               ),
      //             ),
      //             const SizedBox(height: 30.0),
      //             ElevatedButton(
      //               onPressed: () => verify(),
      //               child: const Text('Verify OTP'),
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
