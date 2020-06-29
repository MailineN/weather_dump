import 'package:geolocator/geolocator.dart';
 
class Location {
  double latitude;
  double longitude;
 
  Future<void> getCurrentLocation() async {
    final Geolocator geoLocator = Geolocator()..forceAndroidLocationManager;
    await geoLocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
//      _currentPosition = position;
      latitude = position.latitude;
      longitude = position.longitude;
    });
  }
}