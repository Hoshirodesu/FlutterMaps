import 'package:flutter/material.dart';
import '../models/location_item.dart';
import 'package:latlong2/latlong.dart';
import 'map_page.dart';

class LocationListPage extends StatelessWidget {
  const LocationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = [
      LocationItem(
        name: 'Gedung Sate',
        address: 'Jl. Diponegoro No.22, Bandung',
        distance: '1.2 km',
        icon: Icons.account_balance,
        color: Colors.green,
        coordinates: LatLng(-6.90231172693644, 107.61888418568023)
      ),
      LocationItem(
        name: 'Alun-alun Kota Bandung',
        address: 'Jl. Asia Afrika, Kb. Pisang, Kec. Regol, Kota Bandung, Jawa Barat',
        distance: '1.5 km',
        icon: Icons.park,
        color: Colors.teal,
        coordinates: LatLng(-6.921605829602792, 107.60735197403348)
      ),
      LocationItem(
        name: 'Museum Geologi',
        address: 'Jl. Cihampelas, Bandung',
        distance: '4.0 km',
        icon: Icons.museum,
        color: Colors.blue,
        coordinates: LatLng(-6.900397550653932, 107.62134792597112)
      ),
      LocationItem(
        name: 'Universitas Teknologi Bandung',
        address: 'Jl. Soekarno-Hatta No.378, Kb. Lega, Kec. Bojongloa Kidul, Kota Bandung',
        distance: '5.8 km',
        icon: Icons.school,
        color: Colors.brown,
        coordinates: LatLng(-6.947987692060791, 107.60108990897473)
      ),
       LocationItem(
        name: 'Masjid Raya Bandung',
        address: 'Jl. Alun-alun, Bandung',
        distance: '2.0 km',
        icon: Icons.mosque,
        color: Colors.teal,
        coordinates: LatLng(-6.9215, 107.6074),
      ),
      LocationItem(
        name: 'Braga Street',
        address: 'Jl. Braga, Bandung',
        distance: '1.8 km',
        icon: Icons.restaurant,
        color: Colors.orange,
        coordinates: LatLng(-6.9147, 107.6098),
      ),
      LocationItem(
        name: 'Tangkuban Perahu',
        address: 'Lembang, Bandung Barat',
        distance: '25 km',
        icon: Icons.terrain,
        color: Colors.brown,
        coordinates: LatLng(-6.7597, 107.6098),
      ),
      LocationItem(
        name: 'Kawah Putih',
        address: 'Ciwidey, Bandung Selatan',
        distance: '50 km',
        icon: Icons.water,
        color: Colors.cyan,
        coordinates: LatLng(-7.1661, 107.4025),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Lokasi'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: location.color,
                child: Icon(location.icon, color: Colors.white),
              ),
              title: Text(
                location.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(location.address),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.directions_walk, size: 16),
                      const SizedBox(width: 4),
                      Text(location.distance),
                    ],
                  ),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapPageWithLocation(
                      locationName: location.name,
                      coordinates: location.coordinates,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}