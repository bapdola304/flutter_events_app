import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';

Future getCurrentPosition() async {
  return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high)
      .then((Position position) {
    return getAddressFromLatLng(position);
  }).catchError((e) {
    return e;
    debugPrint(e);
  });
}

Future getAddressFromLatLng(Position position) async {
  return await placemarkFromCoordinates(position.latitude, position.longitude)
      .then((List<Placemark> placemarks) {
    Placemark place = placemarks[0];
    debugPrint('place: $place');
    return "${place.street}, ${place.locality}";
  }).catchError((e) {
    return e;
    debugPrint(e);
  });
}
