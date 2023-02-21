import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:flutter_web/screens/first_screen/utils/animated_container.dart';
import 'package:flutter_web/screens/first_screen/utils/animated_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/responsive.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(

        width: ResponsiveWidget.isSmallScreen(context)
            ? size.width * 0.9
            : size.width * 0.3,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20.0,
          ),),
      padding: EdgeInsets.all(30.0),
      //height: 700,
      child: Column(
        children: [
          Image.asset('assets/images/developer.jpeg'),
          Text("Riya Tyagi",style: GoogleFonts.lato(fontSize: 20),),
          Text("Working in Flutter and looking for change in NCR area",style:GoogleFonts.actor(fontSize: 18),),
          Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: [
              Chip(
              label: Text("Mobile App developer",style: GoogleFonts.actor(fontSize: 20),),
              padding:EdgeInsets.all(10.0) ,
              backgroundColor: Colors.green[300],
            ),
              20.ph,
              Chip(
                label: Text("Web Developer",style: GoogleFonts.actor(fontSize: 20),),
                padding:EdgeInsets.all(10.0) ,
                backgroundColor: Colors.green[300],
              ),
            ]
          ),


          Divider(),
          AnimatedContact(
            iconData: FontAwesomeIcons.github,
            title: "GitHub",
            subtitle: "riyatyagi@99",
            onTap: () {},
          ),
          AnimatedContact(
            iconData: FontAwesomeIcons.medium,
            title: "Medium",
            subtitle: "riyatyagi@4",
            onTap: () {},
          ),
          AnimatedContact(
            iconData: FontAwesomeIcons.linkedin,
            title: "Linkedin",
            subtitle: "riya-tyagi",
            onTap: () {},
          ),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedIconButton(
                iconData: FontAwesomeIcons.facebook,
                onTap: () {},
              ),
              const SizedBox(
                width: 8.0,
              ),
              AnimatedIconButton(
                iconData: FontAwesomeIcons.instagram,
                onTap: () {},
              ),
              const SizedBox(
                width: 8.0,
              ),
              AnimatedIconButton(
                iconData: FontAwesomeIcons.twitter,
                onTap: () {},
              ),
            ],
          )


        ],
      ),

    );
  }
}
