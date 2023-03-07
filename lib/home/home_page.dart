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
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:screenshot/screenshot.dart';
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
  Uint8List? imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();


  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

   List<Widget> tabBar=[];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    tabBar=[TopBarContents(_opacity)];
   // preventSS();
  }

  preventSS() async{
    await ScreenProtector.preventScreenshotOn();
  }

  Future<void> _downloadImage(Uint8List uint8List) async {
    await WebImageDownloader.downloadImageFromUInt8List(uInt8List: uint8List);
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

    return Screenshot(
      controller:screenshotController ,
      child: Scaffold(
       // extendBodyBehindAppBar: true,
        appBar:AppBar(
          title: Row(
            children: [
              Text("Explore",style: GoogleFonts.lato(fontSize: 40,color: Colors.deepOrange),),
              SizedBox(width: 10,),
              InkWell(
                onTap: (){
                  screenshotController.capture(delay: Duration(milliseconds: 10)).then((Uint8List? capturedImage) async{
                    //Capture Done
                    print(" SCreeen shott taken");
                    setState(() {
                      imageFile = capturedImage;
                    });
                    if (capturedImage != null) {
                      _downloadImage(capturedImage);

                    }
                  }).catchError((onError) {
                    print(" Errrrrrror isss  ${onError}");
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Chip(
                      label: Text("SS",style: GoogleFonts.lato(fontSize: 30,color: Colors.deepOrange),)),
                ),
              ),
            ],
          ),
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

      ),
    );
  }
}
