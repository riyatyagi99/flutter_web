@JS('navigator.geolocation')
library jslocation;

import 'package:js/js.dart';

@JS('getCurrentPosition')
external void getPosition(Function success(GeolocationPosition pos,) );



@JS()
@anonymous
class GeolocationCoordinates {
  external factory GeolocationCoordinates({
    double latitude,
    double longitude,
  });

  external double get latitude;
  external double get longitude;
}

@JS()
@anonymous
class GeolocationPosition {
  external factory GeolocationPosition({GeolocationCoordinates coordinates});

  external GeolocationCoordinates get coords;
}
