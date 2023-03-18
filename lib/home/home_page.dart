import 'dart:async';
/*//import 'dart:io' if (dart.library.html) 'dart:html';
//import 'dart:io' if (dart.library.html) 'dart:html' as html;
import 'dart:html' if (dart.library.html) 'dart:html';
import 'dart:html' if (dart.library.html) 'dart:html' as html;
import 'dart:js' if (dart.library.js) 'dart:js';
import 'dart:js' if (dart.library.js) 'dart:js' as js;
import 'dart:ui' if (dart.library.ui) 'dart:js' as ui;
//import 'dart:ui' as ui;
//import 'dart:js' as js;
//import 'dart:html' as html;*/
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:flutter_web/common/platform_info.dart';
import 'package:flutter_web/home/widgets/bottom_bar.dart';
import 'package:flutter_web/home/widgets/caraousel.dart';
import 'package:flutter_web/home/widgets/featured_tiles.dart';
import 'package:flutter_web/home/widgets/fetured_heading.dart';
import 'package:flutter_web/home/widgets/floating_quick_access.dart';
import 'package:flutter_web/home/widgets/main_heading.dart';
import 'package:flutter_web/home/widgets/top_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

//import 'package:screen_capturer/screen_capturer.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:screenshot/screenshot.dart';
import '../common/custom_color_container.dart';
import '../common/platform_info.dart';
import '../common/platform_info.dart';
import '../common/platform_info.dart';
import '../common/platform_info.dart';
import '../common/responsive.dart';
import '../common/text_size.dart';
import '../extensions/extensions.dart';
import '../screens/animations/parallax_delegate.dart';
import '../screens/animations/text_dir_chng_ani.dart';
import '../screens/timer.dart';

class HomePage extends StatefulWidget {
  String? workMode;

  HomePage({Key? key, this.workMode}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  Uint8List? imageFile;
  GlobalKey _key = GlobalKey();
  Timer? timer;
  ScreenshotController screenshotController = ScreenshotController();
  PlatformInfo platform = PlatformInfo();
  bool isWeb = PlatformInfo().isWeb();
  final GlobalKey _backgroundImageKey = GlobalKey();

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List<Widget> tabBar = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    tabBar = [TopBarContents(_opacity)];
    // preventSS();
    // timer = Timer.periodic(const Duration(seconds: 5), (Timer t) => _captureScreenShot());
  }

  @override
  void dispose() {
    _scrollController.dispose();
    timer?.cancel();
    super.dispose();
  }

  preventSS() async {
    await ScreenProtector.preventScreenshotOn();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    // debugPrint("${screenSize.height}  full height");
    debugPrint("${screenSize.width}  full height");
    //debugPrint("${screenSize.height*0.65}  full height");

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              child: Text(
                "Explore",
                style:
                    GoogleFonts.lato(fontSize: 40, color: Colors.deepOrange),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // TODO- Screenshot code in extra_code file
          ],
        ),
        actions: ResponsiveWidget.isSmallScreen(context) ? null : tabBar,
        automaticallyImplyLeading:
            (ResponsiveWidget.isSmallScreen(context)) ? true : false,
      ),
      drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
              backgroundColor: Colors.grey,
              child: ListView(
                children: [TopBarContents(_opacity)],
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Work Mode - ${widget.workMode ?? 'WFO'} ",
                        style:
                            const TextStyle(fontSize: 30, color: Colors.teal),
                      ),
                      MyCustomContainer(
                        progress: 0.7,
                        size: 100,
                        backgroundColor: Colors.red.shade400,
                        progressColor: Colors.white,
                        month: month(DateTime.now()),
                        date: DateTime.now().day.toString(),
                      ),
                    ],
                  ),
                  screenSize.width > 801 ? TimerPage() : SizedBox(),
                ],
              ),
            ),
            ResponsiveWidget.isSmallScreen(context)
                ? TimerPage()
                : SizedBox(),
/*
            Stack(
                children: [
                  SizedBox(
                    width: screenSize.width,
                    height: screenSize.height * 1.5,
                child: Flow(
                  delegate: ParallaxFlowDelegate(
                    scrollable: Scrollable.of(context),
                    listItemContext: context,
                    backgroundImageKey: _backgroundImageKey,
                  ),
                  children: [
                    Image.asset(
                      'assets/images/background.jpg',
                      height: screenSize.height * 1.5,
                      width: screenSize.width,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              Positioned(
                  left: 30,
                  top: 50,
                  child: SizedBox(
                    width: screenSize.width,
                    child: Text(
                      "Trying to show Parallax effect",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.09,
                        color: Colors.red,
                      ),
                      // textScaleFactor: ScaleSize.textScaleFactor(context),
                    ),
                  )),
              Positioned(
                  right: 30,
                  bottom: 50,
                  child: SizedBox(
                    width: screenSize.width,
                    child: Text(
                      "This text is in the bottom",
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: screenSize.width * 0.09,
                        color: Colors.red,
                      ),
                      // textScaleFactor: ScaleSize.textScaleFactor(context)
                    ),
                  )),
            ]),
*/
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.95,
              child: Image.asset(
                'assets/images/bg.jpg',
                fit: BoxFit.cover,
                height: screenSize.height * 1.5,
                width: screenSize.width,
              ),
            ),

            // SizedBox(height: 20,),
            Stack(
              children: [
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    FeaturedHeading(screenSize: screenSize),
                    FeaturedTiles(screenSize: screenSize),
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
