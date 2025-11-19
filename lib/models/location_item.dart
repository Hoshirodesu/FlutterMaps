import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class LocationItem {
  final String name;
  final String address;
  final String distance;
  final IconData icon;
  final Color color;
  final LatLng coordinates;

  LocationItem({
    required this.name,
    required this.address,
    required this.distance,
    required this.icon,
    required this.color,
    required this.coordinates,
  });
}