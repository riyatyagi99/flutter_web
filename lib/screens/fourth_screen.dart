
import 'package:flutter/material.dart';
import 'package:flutter_web/screens/third_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'home_page.dart';


class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Your are not authenticated")
        ],
      ),
    );
  }
}


