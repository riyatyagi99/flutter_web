import 'dart:html';
import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_web/extensions/extensions.dart';
import '../../common/responsive.dart';
import 'package:latlong2/latlong.dart';

import 'loc.dart';
import 'location_model.dart';

class SecondScreen extends StatefulWidget {
  UserData? data;

  SecondScreen({Key? key, this.data}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  LocationModel model = LocationModel();
  final mapController = MapController();
  double _latitude = 0.0;
  double _longitude = 0.0;
  String _city = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.data?.name ?? 'Hello'}/ ${widget.data?.userName ?? 'Welcome!'}"),
        automaticallyImplyLeading:
            (ResponsiveWidget.isSmallScreen(context)) ? true : false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('LAT : $_latitude'),
                Text('LONG : $_longitude'),
                Text('CITY : $_city'),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (kIsWeb) {
                        getPosition(allowInterop((GeolocationPosition pos) {
                          try{
                            setState(() {
                              _latitude = pos.coords.latitude;
                              _longitude = pos.coords.longitude;
                            });
                          }catch (e){
                            print("===========>  ${e.toString()}");
                            // throw Exception(e.toString());
                          }
                          throw ">>>>>>>>>>>>>>>>${pos.toString()}" ;
                        }
                        )

                        );
                      }

                    },
                    child: Text("Ur location using JS")),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      model = await LocationAPI().fetchData();
                      setState(() {
                        _city = model.city ?? '';
                        _longitude = model.longitude ?? 0;
                        _latitude = model.latitude ?? 0;
                      });
                    },
                    child: Text("Ur location using HTTP")),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: FlutterMap(
                    mapController: mapController,
                    options: MapOptions(
                      center: LatLng(0.0, 0.0),
                      zoom: 10,
                      screenSize: size
                    ),
                    nonRotatedChildren: [],
                    children: [

                      TileLayer(
                        urlTemplate:
                            "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        userAgentPackageName:
                            'dev.fleaflet.flutter_map.example',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(28.664343, 72.34343),
                            width: 80,
                            height: 80,
                            builder: (context) => FlutterLogo(),
                          ),
                        ],
                      ),
                      PolygonLayer(
                        polygonCulling: false,
                        polygons: [
                          Polygon(
                            points: [LatLng(29.664343, 73.34343), LatLng(28.664343, 72.34343)
                              , LatLng(30.664343, 76.34343),],
                            color: Colors.blue,
                            borderColor: Colors.deepOrange,
                            borderStrokeWidth: 5,
                            isFilled: true,

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );


  }



}
