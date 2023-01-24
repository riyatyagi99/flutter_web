import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/main_heading.dart';

import '../widgets/caraousel.dart';
import '../widgets/featured_tiles.dart';
import '../widgets/fetured_heading.dart';
import '../widgets/floating_quick_access.dart';
import '../widgets/top_bar.dart';


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

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    debugPrint("${screenSize.height}  full height");
    debugPrint("${screenSize.width}  full height");
    debugPrint("${screenSize.height*0.65}  full height");

    return Scaffold(
     // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:Size(screenSize.width,80) ,
        child: TopBarContents(_opacity),
      ),
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
                    MainCarousel()
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
