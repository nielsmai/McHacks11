import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Import the package for handling LatLng

class Level1Screen extends StatelessWidget {
  const Level1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level 1 - Flutter Map'),
      ),
    );
  }
}
