import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'dart:io';
import '../../common/platform_info.dart';
import '../../common/responsive.dart';



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
      appBar: AppBar(
        automaticallyImplyLeading: (ResponsiveWidget.isSmallScreen(context) ) ? true: false,
      ),
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


