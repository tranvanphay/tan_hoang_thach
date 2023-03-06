import 'package:flutter/material.dart';
import 'package:tan_hoang_thach/widget/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Text(
              "Tan Hoang Thach",
              style: TextStyle(color: Colors.black, fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
