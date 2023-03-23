/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import '../go_router/app_routes_constants.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}

*/

import 'dart:math';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'animations/parallax_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import 'dart:io';
import '../go_router/app_routes_constants.dart';

class UserInput extends StatefulWidget {
  UserInput({
    Key? key,
  }) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  BuildContext? context1;
  final GlobalKey _backgroundImageKey = GlobalKey();
  TextEditingController userInput = TextEditingController();
  TextEditingController petController = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  imageClickEvent(String picId) async {
    await FirebaseAnalytics.instance.logEvent(
      name: "image_tap",
      parameters: {
        "content_type": "image",
        "item_id": picId,
      },
    );
  }

  inputDeco(String hintText) {
    return InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black, width: 1.0),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ));
  }



   Future<UserCredential?> signInEmailPassword(String email, password) async {
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code.toString());
      if (e.code == "wrong-password") {
        Fluttertoast.showToast(msg: "Wrong Password! Please enter the right password or make sure you have account with these details",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
        );
        // AppUtils.showSnackBar("Wrong Password! Please enter the right password or make sure you have account with these details");
      } else {
        // AppUtils.showSnackBar(e.message);}
        return userCredential;
      }
    }
  }


@override
  void initState() {
    super.initState();
    trackScreens();
  }

  trackScreens() async{
    await FirebaseAnalytics.instance
        .setCurrentScreen(
        screenName: 'Products'
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  print("welcome pic click");
                  imageClickEvent("welcome_pic");
                },
                child: Image.asset(
                  'assets/images/welcome.jpg',
                  height: 300,
                  width: 800,
                  fit: BoxFit.cover,
                 // scale: 2.5,
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: userInput,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Can\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      decoration:inputDeco("What do you want? Remote/WFO")
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: petController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Can\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      decoration:inputDeco("What do you like? Dogs/Cats")
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Can\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      decoration:inputDeco("Email")
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Can\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {},
                      decoration:inputDeco("Password")
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: ()async {
                      // if(Platform.isIOS || Platform.isAndroid){
                      //   print("Nothing");
                      // }else{
                        UserCredential?  userCredential= await signInEmailPassword(email.text.toString(),password.text.toString());
                        if(userCredential!=null){
                          GoRouter.of(context).pushNamed(
                            AppRouteNames.homeRouteName,
                            queryParams: {'workMode': userInput.text},
                          );
                        }else{
                          Fluttertoast.showToast(msg: "Wrong Password! Please enter the right password or make sure you have account with these details",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 2,
                          );
                          print("Credentials are not correct");
                        }
                     // }

                    },
                    child: const Text("Submit")),
                ElevatedButton(onPressed: () async{
                  await FirebaseAnalytics.instance.
                  setUserProperty(name: 'fav_pet',value: petController.text, );
                  await FirebaseAnalytics.instance.
                  setUserId( id:Random().nextInt(20).toString() );
                }, child: const Text("Choose"))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: Flow(
                        delegate: ParallaxFlowDelegate(
                          scrollable: Scrollable.of(context),
                          listItemContext: context,
                          backgroundImageKey: _backgroundImageKey,
                        ),
                        children: [
                          Image.asset(
                            'assets/images/background.jpg',
                            key: _backgroundImageKey,
                            height: screenSize.height * 1.5,
                            width: screenSize.width,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // _buildParallaxBackground(context,_backgroundImageKey),
                _buildTitleAndSubtitle('Trying to show Parallax effect',
                    'Hurray!! You can see it'),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    print("second pic click");
                    imageClickEvent("bg_pic");
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.95,
                    child: Image.asset(
                      'assets/images/second_bg.jpg',
                      height: screenSize.height * 1.5,
                      width: screenSize.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _buildTitleAndSubtitle(
                    'Without Parallax effect', 'Ooops! Not here'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle(String first, String second) {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            first,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            second,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
