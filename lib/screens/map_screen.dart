import 'dart:async';
import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tasty_food/screens/your_details_screen.dart';

class MapScreen extends StatefulWidget {
  final  double price;
  const MapScreen({Key? key, required this.price}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );

  List<Marker> _markers = [];
  LatLng? _selectedLocation;

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value) {}).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      log("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }
  Future<String> getPlaceName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String? placeName = placemark.name;
        String? city = placemark.locality;
        String? country = placemark.country;
        return '$placeName, $city, $country';
      }
    } catch (e) {
      log('Error: $e');
    }
    return 'Place not found';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _kGoogle,
              markers: Set<Marker>.of(_markers),
              mapType: MapType.normal,
              myLocationEnabled: true,
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              onTap: (LatLng latLng) {
                setState(() {
                  _markers = [
                    Marker(
                      markerId: const MarkerId('2'),
                      position: latLng,
                      infoWindow: const InfoWindow(
                        title: 'My Position',
                      ),
                    ),
                  ];
                  _selectedLocation = latLng;
                });
              },
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: InkWell(
                onTap: () {
                  if (_selectedLocation != null) {
                    log('Selected Location: ${_selectedLocation.toString()}');
                    getPlaceName(_selectedLocation!.latitude, _selectedLocation!.longitude).then((result) {
                      log(result);
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => YourDetails(selectedLocation: result, price: widget.price, latLng: LatLng(_selectedLocation!.latitude, _selectedLocation!.longitude),),));
                    });
                  }
                },

                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.orange,
                  ),
                  child: const Center(
                    child: Text(
                      "Location Set",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
