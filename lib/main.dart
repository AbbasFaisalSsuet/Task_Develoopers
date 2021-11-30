// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_develoopers/email_verify.dart';
import 'package:task_develoopers/phone_verify.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Develoopers Task')),
      ),
      bottomNavigationBar: (BottomAppBar(
        color: Theme.of(context).primaryColorDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        // ignore: prefer_const_constructors
                        return LoginPhone();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.phone)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        // ignore: prefer_const_constructors
                        return LoginEmail();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.email)),
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 250.0,
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              child: const Center(
                child: Text(
                  'Login To Continue ... Plzz Login With Phone Number Or Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
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
