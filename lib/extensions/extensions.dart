import 'package:flutter/cupertino.dart';



extension SizedBoxGap on num{
  SizedBox get ph=>SizedBox(height: toDouble(),);
  SizedBox get pw=>SizedBox(width: toDouble(),);
}

extension WidgetPaddingX on Widget {
  Widget paddingAll(double padding) => Padding(
    padding: EdgeInsets.all(padding),
    child: this,
  );
}


/*
extension HoverExtensions on Widget {
  // Get a regerence to the body of the view
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,

      // When the mouse enters the widget set the cursor to pointer
      onHover: (event) {
        appContainer?.style.cursor = 'pointer';
      },
      // When it exits set it back to default
      onExit: (event) {
        appContainer?.style.cursor = 'default';
      },
    );
  }
}
*/

class UserData{
  String? name;
  String? userName;
  UserData({this.name="Riyaaaa", this.userName="riyatyagi@4"});

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'] ;
    userName = json['userName'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['userName'] = userName;
    return data;
  }
}