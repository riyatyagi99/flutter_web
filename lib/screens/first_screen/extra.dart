import 'package:flutter/material.dart';

import '../../common/responsive.dart';

class Extra extends StatelessWidget {
  const Extra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      alignment: WrapAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          alignment: Alignment.center,
          child: const Text(
            "Other Details",
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        //
        Container(
          width: ResponsiveWidget.isSmallScreen(context)
         ? size.width * 0.9
        : (size.width * 0.7)/3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Programming Langauges",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  Chip(
                    label: Text(
                      "Dart",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                    ),
                    side: BorderSide(
                      color: Colors.indigo,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Java",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                    ),
                    side: BorderSide(
                      color: Colors.indigo,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "HTML,CSS",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                    ),
                    side: BorderSide(
                      color: Colors.indigo,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        //
        //
        Container(
          width:ResponsiveWidget.isSmallScreen(context)
              ? size.width * 0.9
              : (size.width * 0.7)/3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Hobbies",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  Chip(
                    label: Text(
                      "Adventures & Sports",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Doodling and Drawing",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Having pets",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.cyan,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        //
        //
        Container(
          width: ResponsiveWidget.isSmallScreen(context)
              ? size.width * 0.9
              : (size.width * 0.7)/3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Other Info",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: const [
                  Chip(
                    label: Text(
                      "UP,Indian",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "English, Hindi",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                  Chip(
                    label: Text(
                      "Bs Hogya",
                    ),
                    labelStyle: TextStyle(
                      color: Colors.cyan,
                    ),
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
        //
      ],
    );
  }
}
