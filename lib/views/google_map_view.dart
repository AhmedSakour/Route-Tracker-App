import 'package:flutter/material.dart';
import 'package:route_tracker/views/widgets/google_map_view_body.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMapViewBody(),
    );
  }
}
