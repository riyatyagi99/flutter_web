

import 'dart:convert';
import 'package:http/http.dart' as http;

const _url = 'https://geolocation-db.com/json/';


class LocationAPI {
  LocationAPI();

  Future<LocationModel> fetchData() async {
    LocationModel model = LocationModel();
    final resp = await http.get(Uri.parse(_url));

    if (resp.statusCode == 200) {
      final data = LocationModel.fromJson(json.decode(resp.body));

      model = data;
    }

    return model;
  }


}





class LocationModel {
  String? countryCode;
  String? countryName;
  String? city;

  double? latitude;
  double? longitude;
  String? iPv4;
  String? state;

  LocationModel(
      {this.countryCode,
        this.countryName,
        this.city,
        this.latitude,
        this.longitude,
        this.iPv4,
        this.state});

  LocationModel.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    countryName = json['country_name'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    iPv4 = json['IPv4'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['IPv4'] = this.iPv4;
    data['state'] = this.state;
    return data;
  }
}