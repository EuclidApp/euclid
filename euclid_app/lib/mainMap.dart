import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:euclid_app/apiServ.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _getRoute();
  }

  void _getRoute() async {
    final apiService = ApiService("AIzaSyBQIIBAMotGEgTGLsnBJLrAqB3RuhF1KDA");
    final route = await apiService.getRoute('Place A', 'Place B');
    _updatePolylines(route);
  }

  void _updatePolylines(List<LatLng> route) {
    setState(() {
      _polylines.add(Polyline(
        polylineId: PolylineId('route'),
        visible: true,
        points: route,
        width: 4,
        color: Colors.blue,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Screen'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        polylines: _polylines,
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0),
          zoom: 12,
        ),
      ),
    );
  }
}
