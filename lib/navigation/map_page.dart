import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mapsapp/screens/login_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Maps'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: LatLng(-6.9175, 107.6191), // Bandung
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            maxZoom: 17,
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-6.9175, 107.6191),
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
          //     Marker(
          //       point: LatLng(-6.921605829602792, 107.60735197403348),
          //       width: 80,
          //       height: 80,
          //       child: const Icon(
          //         Icons.location_pin,
          //         color: Colors.blue,
          //         size: 40,
          //       ),
          //     ),
          //     Marker(
          //       point: LatLng(-6.900397550653932, 107.62134792597112),
          //       width: 80,
          //       height: 80,
          //       child: const Icon(
          //         Icons.location_pin,
          //         color: Colors.blue,
          //         size: 40,
          //       ),
          //     ),
          //     Marker(
          //       point: LatLng(-6.947987692060791, 107.60108990897473),
          //       width: 80,
          //       height: 80,
          //       child: const Icon(
          //         Icons.location_pin,
          //         color: Colors.blue,
          //         size: 40,
          //       ),
          //     ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.move(LatLng(-6.9175, 107.6191), 13.0);
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}

class MapPageWithLocation extends StatefulWidget {
  final String locationName;
  final LatLng coordinates;

  const MapPageWithLocation({
    super.key,
    required this.locationName,
    required this.coordinates,
  });

  @override
  State<MapPageWithLocation> createState() => _MapPageWithLocationState();
}

class _MapPageWithLocationState extends State<MapPageWithLocation> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.locationName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          initialCenter: widget.coordinates,
          initialZoom: 15.0,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
            maxZoom: 19,
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: widget.coordinates,
                width: 80,
                height: 80,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Text(
                        widget.locationName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mapController.move(widget.coordinates, 15.0);
        },
        child: const Icon(Icons.my_location),
      ),
    );
  }
}