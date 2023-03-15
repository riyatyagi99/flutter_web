import 'package:flutter/material.dart';


class MyCustomContainer extends StatelessWidget {
  final Color? backgroundColor;
  final Color? progressColor;
  final double? progress;
  final double? size;
  final String? month;
  final String? date;


  const MyCustomContainer({
    Key? key,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.red,
   this.progress,
  this.size,
    this.month,
    this.date
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),//(size??0 )/ 2
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          children: [
            Container(
              height: 40,
              width: size,
              color: backgroundColor,
              child: Center(child: Text(month??'',style: TextStyle(fontSize: 16,color: Colors.white),)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size,
                height: (size ?? 0)  * (progress ?? 0),
                color: progressColor,
                child: Center(child: Text(date??'',style:  TextStyle(fontSize: 40,color: Colors.red),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

