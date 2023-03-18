import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marquee/marquee.dart';

class MyTextWidget extends StatefulWidget {
  const MyTextWidget({Key? key}):super(key: key);
  @override
  _MyTextWidgetState createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> with SingleTickerProviderStateMixin {
  ScrollController? _scrollController;
  AnimationController? _animationController;
  bool _isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    final isScrollingDown = _scrollController?.position.userScrollDirection == ScrollDirection.forward;
    if (isScrollingDown != _isScrollingDown) {
      setState(() {
        _isScrollingDown = isScrollingDown;
        if (_isScrollingDown) {
          _animationController?.forward();
        } else {
          _animationController?.reverse();
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    _animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return  Container(
      color: Colors.black,
      width: size.width,
      height: size.height/5,
      child: ListView.builder(
         controller: _scrollController ,
        itemBuilder: (BuildContext context, int index) {
          return  Marquee(
            text: 'Trying to make animation where I can show the moving text and change it direction according to scroll',
            style: TextStyle(fontSize: 30,color: Colors.white),
            scrollAxis: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            blankSpace: 20.0,
            velocity: 100.0,
            textDirection:_isScrollingDown? TextDirection.rtl:TextDirection.ltr,
            pauseAfterRound: Duration(seconds: 1),
            startPadding: 10.0,
            accelerationDuration: Duration(seconds: 1),
            accelerationCurve: Curves.linear,
            decelerationDuration: Duration(milliseconds: 500),
            decelerationCurve: Curves.easeOut,
          );
        },

      ),
    );
  }
}