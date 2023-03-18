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


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'animations/parallax_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import '../go_router/app_routes_constants.dart';


class UserInput extends StatefulWidget {
  UserInput({
   Key? key,
  }):super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  BuildContext? context1;
  final GlobalKey _backgroundImageKey = GlobalKey();
  TextEditingController userInput=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset('assets/images/welcome.jpg',height: 300,width: 800,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: SizedBox(
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
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                        const BorderSide(color: Colors.black, width: 1.0),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 1, color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "What do you want? Remote/WFO",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context)
                      .pushNamed(AppRouteNames.homeRouteName,  queryParams:{
                    'workMode':userInput.text
                  } ,);
                },
                child: const Text("Submit")),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Builder(
                  builder: (BuildContext context) {
                    return  SizedBox(
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
                _buildTitleAndSubtitle(   'Trying to see Parallax effect',
                    'Hurray!! You can see it'),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.95,
                  child: Image.asset(
                    'assets/images/bg.jpg',
                    height: screenSize.height * 1.5,
                    width: screenSize.width,
                    fit: BoxFit.cover,
                  ),
                ),
                _buildTitleAndSubtitle(   'Without Parallax effect',
                    'Ooops! Not here'),              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTitleAndSubtitle( String first, String second) {
    return Positioned(
      left: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            first,

            style:  TextStyle(
              color: Colors.white,
              fontSize:  MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            second,
            style:  TextStyle(
              color: Colors.white,
              fontSize:  MediaQuery.of(context).size.width * 0.05,
            ),
          ),
        ],
      ),
    );
  }

}





