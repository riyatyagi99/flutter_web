import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/responsive.dart';


class NavActionItems extends StatelessWidget {
  const NavActionItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Row(
      children:  [
        InkWell(
          onTap: () {

          },
          child:Icon(Icons.search,size: 30,color: Colors.white,) ,
        ),
        10.pw,
        ResponsiveWidget.isExtraScreen(context)? SizedBox(): InkWell(
            onTap: (){
            },
            child: Icon(Icons.notifications,size: 30,color: Colors.white,)
        ),
        10.pw,
        InkWell(
            onTap: (){
            },
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Chip(
                label: const FaIcon(
                    FontAwesomeIcons.faceLaugh,
                  size: 20,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                backgroundColor: Colors.green[300],

              ),
            )
        ),

      ],
    );
  }
}
