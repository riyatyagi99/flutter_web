import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ExtraCode extends StatelessWidget {
  const ExtraCode({Key? key}) : super(key: key);


  void takeScreenshott() {
    // html.Window window = html.window;
    // window.captureScreenshot().then((dataUrl) {
    //   print(dataUrl);
    // });
  }



  // internal method errors
  captureFullWindow() async{
    // CapturedData? capturedData = await ScreenCapturer.instance.capture(
    //   mode: CaptureMode.screen, // screen, window
    // );
  }

/*

  Future<CanvasElement> captureScreen() async {
  int? width = window.screen?.width;
  int? height = window.screen?.height;

  //========Canvas Element===========
  CanvasElement canvas = CanvasElement(width: width, height: height);
  CanvasRenderingContext2D? context = canvas.context2D;
  CanvasImageSource? img = document.querySelector('img') as CanvasImageSource;
  // context.drawImage(await html.window.canvas.captureFullPage(), 0, 0);
  //   await html.window.document.documentElement(window, 0, 0, width, height, '#FFFFFF') ;
  context.drawImage(img, 0, 0);
  return canvas;

  //========Image Element===========
  // ImageElement image = ImageElement(width: width, height: height);
  // html.CanvasElement canvas = html.CanvasElement(width: width, height: height);
  // Element? documentElement;
  // print("hellllpo");
  // image.src = canvas.toDataUrl('image/png');
  // return image;


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
      // if(Platform.isAndroid){
      //   final resultsave = await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes),quality: 90,name: 'screenshot-${DateTime.now()}');
      //
      // }else{
      //   _downloadImage(pngBytes);
      // }


    _downloadImage(pngBytes);


    }
  }

  Future<void> _downloadImage(Uint8List uint8List) async {
    await WebImageDownloader.downloadImageFromUInt8List(uInt8List: uint8List);
  }
*/

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async{
            //https://cdn.pixabay.com/photo/2015/03/10/17/23/youtube-667451_1280.png
            //   _captureScreenShot();
            // takeScreenshot();


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
    );
  }
}
