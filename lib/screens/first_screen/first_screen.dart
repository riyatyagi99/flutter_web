import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web/screens/first_screen/about.dart';
import 'package:flutter_web/screens/first_screen/education.dart';
import 'package:marquee/marquee.dart';
import '../../common/platform_info.dart';
import '../../common/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../../common/text_size.dart';
import '../animations/text_dir_chng_ani.dart';
import 'extra.dart';

class FirstScreen extends StatefulWidget {
  String? firstScreenName;

  FirstScreen({Key? key, this.firstScreenName}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin{
  List<Widget> navItems=[];
 final skillKey=GlobalKey();

  ScrollController? _scrollController;
 // AnimationController? _animationController;
  bool _isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    navItems=[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {}, child: Text("Movies")),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              Scrollable.ensureVisible(skillKey.currentContext!);
            },
            child: Text("Games")),
      ),

    ];
    _scrollController = ScrollController();
    _scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    final isScrollingDown = _scrollController?.position.userScrollDirection == ScrollDirection.forward;
    if (isScrollingDown != _isScrollingDown) {
      setState(() {
        _isScrollingDown = isScrollingDown;
      });
    }
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }



  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.teal,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );



  @override
  Widget build(BuildContext context) {
    debugPrint("${widget.firstScreenName} nameeee");
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Portfolio",style: GoogleFonts.lato(fontSize: 40,color: Colors.deepOrange),),
         actions: ResponsiveWidget.isSmallScreen(context)? null:navItems,
        automaticallyImplyLeading: (ResponsiveWidget.isSmallScreen(context) ) ? true: false,
      ),
      drawer: ResponsiveWidget.isSmallScreen(context)?Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: navItems,
        ),
      ):null,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options:particles ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          controller: _scrollController,
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 20,
                spacing: 20,
                children: [
                  AboutScreen(),
                  EducationScreen()
                ],
              ),
              Extra(key: skillKey,),
              const SizedBox(height: 50),
              Container(
                color: Colors.black,
                width: size.width,
                height: size.height/5,
                child: Marquee(
                  text: 'Trying to make animation where I can show the moving text and change its direction on the basis of scroll',
                  style:  TextStyle(fontSize:30,color: Colors.white, ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  textScaleFactor: ScaleSize.textScaleFactor(context),
                  textDirection:_isScrollingDown? TextDirection.rtl:TextDirection.ltr,
                  pauseAfterRound: const Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              SizedBox(height: 50),

            ],
          ),
        ),
      ),
    );
  }
}
