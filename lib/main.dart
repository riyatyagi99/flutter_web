import 'package:flutter/material.dart';
import 'go_router/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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


