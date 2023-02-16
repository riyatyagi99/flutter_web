import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';

import '../../widgets/responsive.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: ResponsiveWidget.isSmallScreen(context)
          ? size.width * 0.9
          : size.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
      ),
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Text("Education",style: GoogleFonts.lato(fontSize: 20),),
          30.ph,
          Timeline.tileBuilder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              builder:TimelineTileBuilder.fromStyle(
                itemCount: 4,
                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          index==0? textContent("2014","Completed 10th","10th grade from VidyaGyan School,"
                              " with 90% of marks were secured by me"):index==1?
                          textContent("2016","Completed 12th","12th grade from VidyaGyan School,"
                              " with 95% of marks were secured by me"):index==2?
                          textContent("2016-2020","BTech(IT)","Completed my BTech from COER college, Roorkee. Frankly writing, was the worst college"):
                       textContent("2021-2023","Mobcoder Company","Working in Flutter with good colleagues and mentor"),

                        ],
                      )
                    ),
                  );
                },
              )
          )

        ],
      ),
    );
  }

  Widget textContent(String text1,String text2,String text3){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
            text1,
            style: const TextStyle(
            fontSize: 12.0,
              fontWeight: FontWeight.w400,
            color: Colors.indigo,
        )
        ), Text(
            text2,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
        )
        ), Text(
            text3,
            style:  TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade700,
        )
        ),
      ],
    );
  }


}
