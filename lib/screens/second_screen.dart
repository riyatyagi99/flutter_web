
import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:flutter_web/screens/third_screen.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'home_page.dart';


class SecondScreen extends StatefulWidget {
  UserData? data;
   SecondScreen({Key? key,this.data}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint("${widget.data?.name} nadenjdjjdnmeeee");
    debugPrint("${widget.data?.userName} nusernameeee");

    return   Scaffold(
      body: Column(
        children: [
          Text(widget.data?.name??''),
          20.ph,
          Text(widget.data?.userName??''),
        ],
      ),
    );
  }
}


