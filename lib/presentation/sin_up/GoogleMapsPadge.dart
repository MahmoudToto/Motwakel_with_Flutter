import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPadge extends StatefulWidget {
  @override
  _GoogleMapsPadgeState createState() => _GoogleMapsPadgeState();
}

class _GoogleMapsPadgeState extends State<GoogleMapsPadge> {
  late GoogleMapController mapController;

  final LatLng _initialPosition =
      const LatLng(30.0444, 31.2357); // Cairo, Egypt

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 14.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId("marker_1"),
            position: _initialPosition,
            infoWindow: InfoWindow(
              title: "Cairo, Egypt",
              snippet: "The capital of Egypt!",
            ),
          ),
        },
      ),
    );
  }
}
