import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (isLocationServiceEnabled == false) {
        Future.error('Location services is not enabled');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
        if (permission == LocationPermission.denied) {
          Future.error('Location permissions are denied');
        }
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      //print(e);
    }
  }
}
/*
LocationPermission permission;
bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
if (isLocationServiceEnabled == false) {
Future.error('Location services is enabled');
}

permission = await Geolocator.checkPermission();
if (permission == LocationPermission.denied) {
permission = await Geolocator.requestPermission();
if (permission == LocationPermission.deniedForever) {
Future.error(
'Location permissions are permanently denied, we cannot request permissions.');
}
if (permission == LocationPermission.denied) {
Future.error('Location permissions are denied');
}
}
Position position = await Geolocator.getCurrentPosition(
desiredAccuracy: LocationAccuracy.low);
print(position.latitude);
print(position.longitude);*/
