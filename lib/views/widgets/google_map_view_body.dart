import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapViewBody extends StatefulWidget {
  const GoogleMapViewBody({super.key});

  @override
  State<GoogleMapViewBody> createState() => _GoogleMapViewBodyState();
}

class _GoogleMapViewBodyState extends State<GoogleMapViewBody> {
  late CameraPosition cameraPosition;
  @override
  void initState() {
    cameraPosition = const CameraPosition(target: LatLng(0, 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      initialCameraPosition: cameraPosition,
    );
  }
}
