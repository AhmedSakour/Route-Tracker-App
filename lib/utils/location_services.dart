import 'package:location/location.dart';
import 'package:route_tracker/errors/location_permission_exception.dart';
import 'package:route_tracker/errors/location_services_exception.dart';

class LocationServices {
  Location location = Location();
  Future<void> checkAndRequestLocationService() async {
    bool isEnabled = await location.serviceEnabled();
    if (!isEnabled) {
      isEnabled = await location.requestService();
      if (!isEnabled) {
        LocationServicesException();
      }
    }
  }

  checkAndRequestLocationPermission() async {
    PermissionStatus permissinState = await location.hasPermission();
    if (permissinState == PermissionStatus.deniedForever) {
      LocationPermissionException();
    }
    if (permissinState == PermissionStatus.denied) {
      permissinState = await location.requestPermission();
      if (permissinState != PermissionStatus.granted) {
        LocationPermissionException();
      }
    }
  }

  getRealTimeLocationData(void Function(LocationData)? onData) async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen(onData);
  }

  getLocationData() async {
    await checkAndRequestLocationService();
    await checkAndRequestLocationPermission();
    return await location.getLocation();
  }
}
