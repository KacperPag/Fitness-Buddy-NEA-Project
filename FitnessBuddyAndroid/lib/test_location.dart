/*
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geoLocator;
import 'package:google_maps_flutter/google_maps_flutter.dart' as poly;
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FullMap(),
    );
  }
}

String _styleString = "mapbox://styles/keephealthy/cl87gu10y00bo15ml2ft0c8gb";

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

LatLng _center = const LatLng(0, 0);
List<LatLng> route = [];

double _dist = 0;
late String _displayTime;
late int _time;
late int _lastTime;
double _speed = 0;
double _avgSpeed = 0;
int _speedCounter = 0;
LatLng loc = LatLng(0, 0);
Location _location_ = Location();

final Set<poly.Polyline> polyline = {};

class FullMapState extends State<FullMap> {
  late MapboxMapController mapController;

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    double appendDist;

    _location_.changeSettings(accuracy: LocationAccuracy.low, interval: 1000, distanceFilter: 5);
    _location_.onLocationChanged.listen((event) {
      loc = LatLng(event.latitude!, event.longitude!);
      if (route.isNotEmpty && loc != route.last) {
        mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: loc, zoom: 200)));
      }
      if (route.isNotEmpty) {
        appendDist = geoLocator.Geolocator.distanceBetween(route.last.latitude, route.last.longitude, loc.latitude, loc.longitude);
        _dist = _dist + appendDist;
        int timeDuration = (_time - _lastTime);

        if (_lastTime != null && timeDuration != 0) {
          _speed = (appendDist / (timeDuration / 100)) * 3.6;
          if (_speed != 0) {
            _avgSpeed = _avgSpeed + _speed;
            _speedCounter++;
          }
        }
      }
      _lastTime = _time;
      route.add(loc);

*/
/*      polyline.add(poly.Polyline(
          polylineId: poly.PolylineId(event.toString()),
          visible: true,
          points: route,
          width: 5,
          startCap: poly.Cap.roundCap,
          endCap: poly.Cap.roundCap,
          color: Colors.deepOrange));*//*

    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            MapboxMap(
              onMapCreated: _onMapCreated,
              accessToken: 'pk.eyJ1Ijoia2VlcGhlYWx0aHkiLCJhIjoiY2w4N29qdTQ0MHA1ajQwbWg0NzRweGp5cyJ9.55ohHEXZgWLr04hXjZEBmA',
              styleString: _styleString,
              initialCameraPosition: CameraPosition(target: LatLng(0, 0), zoom: 200),
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.Tracking,
              myLocationRenderMode: MyLocationRenderMode.COMPASS,
            ),
          ],
        )
    );
  }
}*/
