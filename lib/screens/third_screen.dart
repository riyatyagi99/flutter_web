import 'package:flutter/material.dart';


class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("Wish you good luck 3333!",style: TextStyle(fontSize: 30),),),
            Center(child: Text("Wish you good luck 3333!",style: TextStyle(fontSize: 30),),),
          ],
        ),
      ),
    );
  }
}
