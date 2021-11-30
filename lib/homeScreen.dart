// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget buildPlan(int index) {
    return Padding(
      child: Column(children: <Widget>[
        Card(
          color: Colors.black87,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Helo World',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '100-INR',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '2-Days Left',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 50.0),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Latest Plans',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '0 - 10',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          }
          return buildPlan(index);
        },
      ),
    );
  }
}
