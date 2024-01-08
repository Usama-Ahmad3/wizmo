import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/utils/navigator_class.dart';

class MapScreenProvider with ChangeNotifier {
  GoogleMapController? mapController;
  bool _loading = true;
  bool get loading => _loading;
  List<Marker> allMarkers = [];
  double lat = 0.0;
  double long = 0.0;
  getLocationPermission(
      TextEditingController location, SellCarModel sellCarModel) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print('Temporary');
      await Geolocator.openLocationSettings();
    } else if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      await Geolocator.requestPermission();
      print('Permanent');
    } else {
      location = await defaultLocation(location, sellCarModel);
    }
  }

  Future<TextEditingController> defaultLocation(
      TextEditingController location, SellCarModel sellCarModel) async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) async {
      print('ok jxddddddddddddddddddddddddddddddddd');
      long = value.longitude;
      lat = value.latitude;
      sellCarModel.latitude = value.latitude.toString();
      sellCarModel.longitude = value.longitude.toString();
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      print(placemarks);
      location.text =
          '${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}';
    });
    // var coordinates = Coordinates(control.latitude, control.longitude);
    addMarker();
    _loading = false;
    notifyListeners();
    print(location.text);
    return location;
  }

  addMarker() {
    allMarkers.clear();
    allMarkers.add(Marker(
      markerId: const MarkerId('myMarker'),
      draggable: false,
      onTap: () {
        debugPrint('marker');
      },
      position: LatLng(lat, long),
    ));
  }

  pop(context) {
    Navigation().pop(context);
  }
}
