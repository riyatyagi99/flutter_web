import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/home/widgets/bottom_bar.dart';
import 'package:flutter_web/home/widgets/caraousel.dart';
import 'package:flutter_web/home/widgets/featured_tiles.dart';
import 'package:flutter_web/home/widgets/fetured_heading.dart';
import 'package:flutter_web/home/widgets/floating_quick_access.dart';
import 'package:flutter_web/home/widgets/main_heading.dart';
import 'package:flutter_web/home/widgets/top_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../common/platform_info.dart';
import '../common/responsive.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

   List<Widget> tabBar=[];

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
    tabBar=[TopBarContents(_opacity)];
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

   // debugPrint("${screenSize.height}  full height");
    //debugPrint("${screenSize.width}  full height");
    //debugPrint("${screenSize.height*0.65}  full height");

    return Scaffold(
     // extendBodyBehindAppBar: true,
      appBar:AppBar(
        title: Text("Explore",style: GoogleFonts.lato(fontSize: 40,color: Colors.deepOrange),),
        actions: ResponsiveWidget.isSmallScreen(context)? null:tabBar,
        automaticallyImplyLeading: (ResponsiveWidget.isSmallScreen(context) ) ? true: false,
      ),
      drawer: ResponsiveWidget.isSmallScreen(context)?Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: [
            TopBarContents(_opacity)
          ],
        ),
      ):null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: screenSize.height *0.55,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/bg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize:screenSize),
                    MainHeading(screenSize: screenSize),
                    MainCarousel(),
                    BottomBar()
                  ],
                ),


              ],
            ),

          ],
        ),
      ),

    );
  }
}
