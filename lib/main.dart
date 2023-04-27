import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'go_router/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBL5GcaTpUofIMri3ZQvX0h31p3ac6lMo8",
          appId: "1:1007693805542:web:70edda53c2be3302014827",
          messagingSenderId: "flutterweb-b599d",
          projectId: "1007693805542")
  );

   if(kIsWeb){
    Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBL5GcaTpUofIMri3ZQvX0h31p3ac6lMo8",
            appId: "1:1007693805542:web:70edda53c2be3302014827",
            messagingSenderId: "flutterweb-b599d",
            projectId: "1007693805542")
    );
  }else{
    print("Nothing============");
  }
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        //canvasColor: Colors.purple.shade50,
        useMaterial3: true,
        fontFamily: "custom",
      ),
    // routerConfig: ,
     routeInformationParser: MyAppRouters().returnRouter(true).routeInformationParser,
     routerDelegate: MyAppRouters().returnRouter(true).routerDelegate ,

     // initialRoute: '/',
     // home: const HomePage(),
    );
  }
}


