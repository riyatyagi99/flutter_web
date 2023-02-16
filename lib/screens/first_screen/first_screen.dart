import 'package:animated_background/animated_background.dart';
import 'package:animated_background/particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/screens/first_screen/about.dart';
import 'package:flutter_web/screens/first_screen/education.dart';
import 'package:flutter_web/widgets/responsive.dart';
import 'package:google_fonts/google_fonts.dart';

import 'extra.dart';

class FirstScreen extends StatefulWidget {
  String? firstScreenName;

  FirstScreen({Key? key, this.firstScreenName}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with SingleTickerProviderStateMixin{
  List<Widget> navItems=[];
 final skillKey=GlobalKey();

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.teal,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 70,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 100.0,
    spawnMinSpeed: 30,
    spawnMinRadius: 7.0,
  );

  @override
  void initState() {
    super.initState();
    navItems=[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: () {}, child: Text("Movies")),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {
              Scrollable.ensureVisible(skillKey.currentContext!);
            },
            child: Text("Games")),
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("${widget.firstScreenName} nameeee");
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio",style: GoogleFonts.lato(fontSize: 40,color: Colors.deepOrange),),
         actions: ResponsiveWidget.isSmallScreen(context)? null:navItems,
        automaticallyImplyLeading: ResponsiveWidget.isSmallScreen(context)?true: false,
      ),
      drawer: ResponsiveWidget.isSmallScreen(context)?Drawer(
        backgroundColor: Colors.grey,
        child: ListView(
          children: navItems,
        ),
      ):null,
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options:particles ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                runSpacing: 20,
                spacing: 20,
                children: [
                  AboutScreen(),
                  EducationScreen()
                ],
              ),
              Extra(key: skillKey,)

            ],
          ),
        ),
      ),
    );
  }
}
