import 'package:flutter/material.dart';


class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('assets/images/404.png',
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.height/2,));
  }
}
