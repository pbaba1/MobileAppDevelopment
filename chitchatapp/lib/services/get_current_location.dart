import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetCurrentLocation extends StatefulWidget {
  const GetCurrentLocation({Key? key}) : super(key: key);

  @override
  _GetCurrentLocationState createState() => _GetCurrentLocationState();
}

class _GetCurrentLocationState extends State<GetCurrentLocation> {
  Position _currentPosition = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0);
  String _currentAddress = '';
  bool showLocation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_currentPosition != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                tooltip: !showLocation
                    ? 'Click here to display your location.'
                    : 'Click here to hide your location',
                icon: Icon(
                    !showLocation ? Icons.location_on : Icons.location_off),
                color: Colors.indigo,
                onPressed: () {
                  setState(() {
                    showLocation = !showLocation;
                  });
                },
              ),
              showLocation
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "LAT: ${_currentPosition.latitude}\nLNG: ${_currentPosition.longitude}t(",
                            style: const TextStyle(fontSize: 16)),
                        const Text(
                          '\n*Address cannot be generated as the geocoding library doesn\'t have this feature for web.',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      ],
                    )
                  : const SizedBox(),
            ],
          )

        // Text('Current address: ${_currentAddress}'),
      ],
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}
