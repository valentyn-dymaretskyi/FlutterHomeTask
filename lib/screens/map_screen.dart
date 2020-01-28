import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => new _MapScreenState();
}

class _MapScreenState extends State<MapScreen>  {
    Completer<GoogleMapController> _controller = Completer();
    static const LatLng _center = const LatLng(45.521563, -122.677433);

    final Set<Marker> _markers = {};

    void _onMapCreated(GoogleMapController controller) {
      _controller.complete(controller);
      _generateRandomMarkers();
    }

    void _generateRandomMarkers() {
      double nextDouble(num min, num max) => min + Random().nextDouble() * (max - min);

        for (var i = 0; i < 10; i++) {
          double randomLat = nextDouble(45.5, 45.6);
          double randomLng = nextDouble(-122.6, -122.7);

          setState(() {
            _markers.add(Marker(
              markerId: MarkerId(i.toString()),
              position: LatLng(randomLat, randomLng),
              icon: BitmapDescriptor.defaultMarker,
            ));
          });
        }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: _markers,
          ),
      );
    }
}
