import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io';
import '../../common/platform_info.dart';
import '../../common/responsive.dart';
import 'dart:ui' as ui;


class SecondScreen extends StatefulWidget {
    UserData? data;
   SecondScreen({Key? key,this.data}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
  Size size= MediaQuery.of(context).size;

    return   Scaffold(
      appBar: AppBar(
        title: Text("${widget.data?.name }/ ${widget.data?.userName}"),
        automaticallyImplyLeading: (ResponsiveWidget.isSmallScreen(context) ) ? true: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:SizedBox(
          height:size.height ,
          width: size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(target: _center,zoom: 5
            ),
            onMapCreated: _onMapCreated,



          ),
        )
      ),
    );
  }


}






