
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../../common/platform_info.dart';
import '../../common/responsive.dart';


/*
class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key,  this.title}) : super(key: key);

  final String? title;

  @override
  State createState() => _FourthScreenState();
}

class _FourthScreenState extends State {
  final double zoomTargetHeight = 520;
  final double zoomTargetWidth = 600;
  final double zoomOriginalHeight = 225;
  final double zoomOriginalWidth = 400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://source.unsplash.com/random/1600x900?puppies"),
            Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "List of items",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 235,
                      child: ListView.builder(
                        //clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return buildCard(index);
                        },
                        itemCount: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map _showZoom = {};

  Widget buildCard(int index) {
     return InkWell(
       onTap: ()=>null,
       onHover: (value){
         _showZoom["$index"]=value;

         setState(() {

         });
       }
    */
/*  onEnter: (event) {
        setState(() {
          _showZoom["$index"] = true;
        });
      },
      onExit: (event) {
        setState(() {
          _showZoom["$index"] = false;
        });
      }*//*
,
      child: SizedBox(
        height: _showZoom["$index"] == true
            ? zoomTargetHeight: zoomOriginalHeight,
        width:_showZoom["$index"] == true
            ? zoomTargetWidth:  zoomOriginalWidth,
        child: Image.network(
            "https://source.unsplash.com/random/400x225?sig=$index&puppies"),
      ),
    );
   // return stack;
  }
}
*/

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key,  this.title}) : super(key: key);

  final String? title;

  @override
  State createState() => _FourthScreenState();
}

class _FourthScreenState extends State {
  final double zoomTargetHeight = 320;
  final double zoomTargetWidth = 500;
  final double zoomOriginalHeight = 225;
  final double zoomOriginalWidth = 400;

  late final ScrollController _controllerBack;
  late final ScrollController _controllerFront;

  @override
  void initState() {
    super.initState();
    _controllerBack = ScrollController();
    _controllerFront = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: (ResponsiveWidget.isSmallScreen(context) ) ? true: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("https://source.unsplash.com/random/1600x900?cars"),
            Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "List of items",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 225,
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          _controllerFront.jumpTo(_controllerBack.offset);
                          return true;
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ListView.separated(
                              controller: _controllerBack,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return buildBackCard(index);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 12,
                                );
                              },
                              itemCount: 10,
                            ),
                            IgnorePointer(
                              child: ListView.separated(
                                controller: _controllerFront,
                                clipBehavior: Clip.none,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return buildFrontCard(index);
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 12,
                                  );
                                },
                                itemCount: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Map _showZoom = {};

  Widget buildBackCard(int index) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _showZoom["$index"] = true;
        });
      },
      onExit: (event) {
        setState(() {
          _showZoom["$index"] = false;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Image.network(
              "https://source.unsplash.com/random/400x225?sig=$index&puppies",
            ),
            Container(
              color: Colors.black.withAlpha(100),
              height: zoomOriginalHeight,
              width: zoomOriginalWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFrontCard(int index) {
    Widget child;
    double scale;
    if (_showZoom["$index"] == null || !_showZoom["$index"]!) {
      scale = 1;
      child = SizedBox(
        height: zoomOriginalHeight,
        width: zoomOriginalWidth,
      );
    } else {
      scale = zoomTargetWidth / zoomOriginalWidth;
      child = Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: zoomOriginalHeight,
            width: zoomOriginalWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://source.unsplash.com/random/400x225?sig=$index&puppies"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      );
    }
    return AnimatedScale(
      duration: const Duration(milliseconds: 400),
      scale: scale,
      child: child,
    );
  }
}