import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/common/hand_cursor.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:flutter_web/screens/third_screen/action_nav_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import '../../common/platform_info.dart';
import '../../common/responsive.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List images = [
    "assets/images/pic_1.jpeg",
    "assets/images/pic_2.jpeg",
    "assets/images/pic_3.jpeg",
    "assets/images/pic_4.jpeg",
    "assets/images/pic_5.jpeg",
    "assets/images/pic_6.jpeg",
    "assets/images/pic_7.jpeg",
    "assets/images/pic_8.jpeg",
    "assets/images/pic_2.jpeg",
    "assets/images/pic_3.jpeg",
  ];

  bool isHoveringOnMovie = false;
  ScrollController? _scrollBarController;

  @override
  void initState() {
    super.initState();
    _scrollBarController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    debugPrint("${screenSize.width}  full width");

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ResponsiveWidget.isExtraScreen(context) ? "N" : "Netflix",
              style: GoogleFonts.lato(fontSize: 40, color: Colors.deepOrange),
            ),
            50.pw,
            screenSize.width < 400
                ? const SizedBox()
                : (screenSize.width < 900)
                    ? InkWell(
                        onTap: () {},
                        child: Text(
                          "Browse",
                          style: GoogleFonts.lato(
                              fontSize: 15, color: Colors.white),
                        ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Home",
                            style: GoogleFonts.sora(
                                fontSize: 15, color: Colors.white),
                          ),
                          10.pw,
                          InkWell(
                              onHover: (value) {},
                              child: Text(
                                "TV Shows",
                                style: GoogleFonts.lato(
                                    fontSize: 15, color: Colors.white),
                              )),
                          15.pw,
                          Text(
                            "Movies",
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white),
                          ),
                          15.pw,
                          Text(
                            "News & Popular",
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white),
                          ),
                          15.pw,
                          Text(
                            "My List",
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white),
                          ),
                          15.pw,
                          Text(
                            "Browse by Languages",
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.white),
                          ),
                          15.pw,
                        ],
                      )
          ],
        ),
        actions: const [NavActionItems()],

        automaticallyImplyLeading:
            (ResponsiveWidget.isSmallScreen(context)) ? true : false,
      ),
      body: Container(
        color: Colors.black,
        width: screenSize.width,
        height: screenSize.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveWidget.isExtraScreen(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        10.pw,
                        InkWell(
                            onHover: (value) {},
                            child: Text(
                              "TV Shows",
                              style: GoogleFonts.lato(
                                  fontSize: 15, color: Colors.white),
                            )),
                        15.pw,
                        Text(
                          "Movies",
                          style: GoogleFonts.lato(
                              fontSize: 15, color: Colors.white),
                        ),
                        15.pw,
                        Text(
                          "News & Popular",
                          style: GoogleFonts.lato(
                              fontSize: 15, color: Colors.white),
                        ),
                        15.pw,
                      ],
                    )
                  : SizedBox(),
              movieType("Trending Movies"),
              InkWell(
                onTap: () => null,
                onHover: (hovering){
                  setState((){
                    isHoveringOnMovie=hovering;
                    print("${hovering} hovering valueee");
                  });
                },
                child: Stack(
                  children:[
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            var urlImage = images[index];
                            return InkWell(
                              onTap: () => null,
                              onHover: (hovering) {
                                /*setState(() => isHoveringOnMovie = hovering);
                                print("${index} indexxxx");*/
                              },
                              child: Container(
                                color: Colors.white,
                                height: 50,
                                width: 150,
                                margin:
                                const EdgeInsets.symmetric(horizontal: 10),
                                child: allImages(urlImage, index),
                              ),
                            );
                          }),
                    ),

                    isHoveringOnMovie==true?
                    const Positioned(
                      right: 10,
                      top: 45,
                      child: Icon(Icons.arrow_forward_ios_sharp,size: 50,color: Colors.white,),):SizedBox(),
                  ]



                ),
              ),
              movieType("Suspenseful Movies"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("Watch It again"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("Award winning TV Shows"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("US TV Drama"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("Continue Watching"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("New Releases"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("Action Movies"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              movieType("Action Thrillers"),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      var urlImage = images[index];
                      return Container(
                        color: Colors.white,
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: allImages(urlImage, index),
                      );
                    }),
              ),
              30.ph
            ],
          ),
        ),
      ),
    );
  }

  Widget movieType(String movieDes) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Text(movieDes,
          style: GoogleFonts.lato(fontSize: 15, color: Colors.white)),
    );
  }

  Widget allImages(String urlImage, int index) => Image.asset(
        urlImage,
        fit: BoxFit.cover,
        //height: 280,
      );
}
