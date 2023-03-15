import 'dart:async';
import 'dart:html';
import 'dart:ui' as ui;
import 'dart:js' as js;
import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_insta/flutter_insta.dart';
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
import '../common/responsive.dart';
import '../extensions/extensions.dart';
import '../screens/timer.dart';


class HomePage extends StatefulWidget {
  String? workMode;
   HomePage({Key? key,this.workMode}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;
  Uint8List? imageFile;
  GlobalKey _key=GlobalKey();
  Timer? timer;
  ScreenshotController screenshotController = ScreenshotController();


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

  void takeScreenshott() {
  /*  html.Window window = html.window;
    window.captureScreenshot().then((dataUrl) {
      print(dataUrl);
    });*/
  }



  // internal method errors
  captureFullWindow() async{
   /* CapturedData? capturedData = await ScreenCapturer.instance.capture(
      mode: CaptureMode.screen, // screen, window
    );*/
  }





  Future<ImageElement> captureScreen() async {
    int? width = window.screen?.width;
    int? height = window.screen?.height;

/*    CanvasElement canvas = CanvasElement(width: width, height: height);

    CanvasRenderingContext2D? context = canvas.context2D;
    CanvasImageSource? img = document.querySelector('img') as CanvasImageSource;

   // context.drawImage(await html.window.canvas.captureFullPage(), 0, 0);
    context.drawImage(img, 0, 0);

    print("gellllpo");
    return canvas;*/

    ImageElement image = ImageElement(width: width, height: height);
    html.CanvasElement canvas = html.CanvasElement(width: width, height: height);
  Element? documentElement;
    print("hellllpo");

  /*  if(documentElement!=null){
      await html.window.document.documentElement(window, 0, 0, width, height, '#FFFFFF') ;

    }*/
    image.src = canvas.toDataUrl('image/png');
    return image;


  }


  void takeScreenshot() {

    js.context.callMethod('chrome.tabs.query', [
      {'active': true, 'currentWindow': true},
          (tabs) {
        js.context.callMethod('chrome.tabs.sendMessage', [
          tabs[0].id,
          {'type': 'screenshot'},
              (response) {
            final screenshotUrl = response['screenshotUrl'];
          }
        ]);
      }
    ]);
  }

  void _captureScreenShot() async{
    RenderRepaintBoundary bound = _key.currentContext?.findRenderObject() as RenderRepaintBoundary;
    if(bound.debugNeedsPaint){
      Timer(const Duration(seconds: 2),()=>_captureScreenShot());
      return null;
    }

    ui.Image image = await bound.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if(byteData != null ){
      Uint8List pngBytes = byteData.buffer.asUint8List();


    /*  if(Platform.isAndroid){
        final resultsave = await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes),quality: 90,name: 'screenshot-${DateTime.now()}');

      }else{
        _downloadImage(pngBytes);
      }*/


    _downloadImage(pngBytes);


    }
  }

  Future<void> _downloadImage(Uint8List uint8List) async {
    await WebImageDownloader.downloadImageFromUInt8List(uInt8List: uint8List);
  }

  preventSS() async {
    await ScreenProtector.preventScreenshotOn();
  }



  @override
  Widget build(BuildContext context) {
    final now =  DateTime.now();

    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    // debugPrint("${screenSize.height}  full height");
   debugPrint("${screenSize.width}  full height");
    //debugPrint("${screenSize.height*0.65}  full height");

    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Row(
            children: [
              InkWell(

                child: Text(
                  "Explore",
                  style: GoogleFonts.lato(fontSize: 40, color: Colors.deepOrange),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async{
                  //https://cdn.pixabay.com/photo/2015/03/10/17/23/youtube-667451_1280.png
                  //   _captureScreenShot();
                  takeScreenshot();


                  /* ImageElement screenshotImage = await captureScreen();
                      print("screenshotImage  ${screenshotImage}");*/
                  // captureFullWindow();
                  /*
                    screenshotController
                      .capture(delay: Duration(milliseconds: 10))
                      .then((Uint8List? capturedImage) async {
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
                  });*/
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Chip(
                      label: Text(
                        "SS",
                        style: GoogleFonts.lato(
                            fontSize: 30, color: Colors.deepOrange),
                      )),
                ),
              ),
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
                padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Work Mode - ${widget.workMode ?? 'WFO'} ", style:  const TextStyle(fontSize: 30,color: Colors.teal),),
                        MyCustomContainer(
                          progress: 0.7,
                          size: 100,
                          backgroundColor: Colors.red.shade400,
                          progressColor: Colors.white,
                          month:month(DateTime.now()),
                          date:DateTime.now().day.toString() ,
                        ),
                      ],
                    ),

                    screenSize.width>801 ? TimerPage():SizedBox(),
                  ],
                ),
              ),
              ResponsiveWidget.isSmallScreen(context) ? TimerPage(): SizedBox() ,

              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: screenSize.height * 0.55,
                      width: screenSize.width,
                      child: Image.asset('assets/images/bg.jpg',
                        fit: BoxFit.cover,)
                    ),
                  ),

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
      ),
    );
  }
}
