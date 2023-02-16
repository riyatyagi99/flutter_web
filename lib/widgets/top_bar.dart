import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:flutter_web/go_router/app_routes_constants.dart';
import 'package:flutter_web/screens/second_screen.dart';
import 'package:flutter_web/screens/third_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/first_screen/first_screen.dart';
import '../screens/fourth_screen.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;

  TopBarContents(this.opacity);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  var firstScreenName="Riya Tyagi";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      color: Colors.white.withOpacity(widget.opacity),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width/5,),
                  const Text(
                    'Explore',
                    style: TextStyle(
                      color: Color(0xFF077bd7),
                      fontSize: 26,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(width: screenSize.width / 42),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? _isHovering[0] = true
                            : _isHovering[0] = false;
                      });
                    },
                    onTap: () {
                      context.pushNamed(AppRouteNames.firstRouteName,queryParams:{
                        'username':firstScreenName
                      } ,
                     /*     params: {
                        'username':firstScreenName
                      }*/
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'First',
                          style: TextStyle(
                              color: _isHovering[0]
                                  ? Color(0xFF077bd7)
                                  : Color(0xFF077bd7),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[0],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 42),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? _isHovering[1] = true
                            : _isHovering[1] = false;
                      });
                    },
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRouteNames.secondRouteName,extra: UserData());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Second',
                          style: TextStyle(
                              color: _isHovering[0]
                                  ? Color(0xFF077bd7)
                                  : Color(0xFF077bd7),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[1],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 42),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? _isHovering[2] = true
                            : _isHovering[2] = false;
                      });
                    },
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRouteNames.thirdRouteName);

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Third',
                          style: TextStyle(
                              color: _isHovering[0]
                                  ? Color(0xFF077bd7)
                                  : Color(0xFF077bd7),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[2],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: screenSize.width / 42),
                  InkWell(
                    onHover: (value) {
                      setState(() {
                        value
                            ? _isHovering[3] = true
                            : _isHovering[3] = false;
                      });
                    },
                    onTap: () {
                      GoRouter.of(context).pushNamed(AppRouteNames.fourthRouteName);

                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Fourth',
                          style: TextStyle(
                              color: _isHovering[0]
                                  ? const Color(0xFF077bd7)
                                  : const Color(0xFF077bd7),
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          maintainAnimation: true,
                          maintainState: true,
                          maintainSize: true,
                          visible: _isHovering[3],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Color(0xFF051441),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}