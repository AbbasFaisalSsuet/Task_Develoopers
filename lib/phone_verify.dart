// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_final_fields, unused_field

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:task_develoopers/OTPController.dart';

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key? key}) : super(key: key);

  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  String dialCodeDigits = "+00";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: duplicate_ignore
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 200.0,
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  'Phone OTP Verfication',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              // height: 60,
              // width: 500,
              child: CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    dialCodeDigits = country.dialCode!;
                  });
                },
                initialSelection: 'IT',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                // ignore: prefer_const_literals_to_create_immutables
                favorite: ["+1", "USA", "+92", "PAK"],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Phone Number",
                  prefix: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(dialCodeDigits),
                  ),
                ),
                maxLength: 12,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => OTPControll(
                            phone: _controller.text,
                            codeDigits: dialCodeDigits,
                          )));
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
