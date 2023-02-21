import 'package:flutter/material.dart';
import 'bottom_bar_column.dart';
import 'info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);
  static const Color gradientStartColor = Color(0xff11998e);
  static const Color gradientEndColor = Color(0xff0575E6);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: gradientStartColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
          BoxShadow(
            color: gradientEndColor,
            offset: Offset(1.0, 6.0),
            blurRadius: 1.0,
          ),
        ],
        gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: FractionalOffset(0.2, 0.2),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: const EdgeInsets.all(30),
      //color: Colors.blueGrey[900],
      child: Column(
        children: [
          screenSize.width < 800
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomBarColumn(
                          heading: 'ABOUT',
                          s1: 'Contact Us',
                          s2: 'About Us',
                          s3: 'Careers',
                        ),
                        BottomBarColumn(
                          heading: 'HELP',
                          s1: 'Payment',
                          s2: 'Cancellation',
                          s3: 'FAQ',
                        ),
                        BottomBarColumn(
                          heading: 'SOCIAL',
                          s1: 'Twitter',
                          s2: 'LinkedIn',
                          s3: 'Instagram',
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white,
                      width: screenSize.width,
                      height: 0.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'riya@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: 'Noida, sector-62, UP, 201301',
                        )
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'LinkedIn',
                      s3: 'Instagram',
                    ),
                    Container(
                      color: Colors.white,
                      width: 2,
                      height: 150,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoText(
                          type: 'Email',
                          text: 'riya@gmail.com',
                        ),
                        SizedBox(height: 5),
                        InfoText(
                          type: 'Address',
                          text: 'Noida, sector-62, UP, 201301',
                        )
                      ],
                    ),
                  ],
                ),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            'Copyright © 2023 | RiyaTyagi',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
