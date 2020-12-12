import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MapPage(),
));

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}
class MapPageState extends State<MapPage> {

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(-11.8958969,-77.0481508);

    // these are the minimum required values to set
    // the camera position
    CameraPosition initialLocation = CameraPosition(
        zoom: 15,
        bearing: 30,
        target: pinPosition
    );

    return GoogleMap(
        myLocationEnabled: true,
        compassEnabled: true,
        markers: _markers,
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(Utils.mapStyles);
          _controller.complete(controller);
          setState(() {
            _markers.add(
                Marker(
                    markerId: MarkerId('001'),
                    position: pinPosition,
                    icon: pinLocationIcon,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(
                                  title: Text("Museo de arte escenico de Comas"),
                                ),
                                body: ListView(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('Pintura Manila - Arte Urbano 2017'),
                                    ),
                                    ListTile(
                                      title: Text('Escultura en Arcilla Andina - Cultura - 2019'),
                                    ),
                                    ListTile(
                                      title: Text('Danza en expresiones corporales - Baile - 2018'),
                                    ),
                                  ],
                                ),
                              );
                            },
                            fullscreenDialog: true,
                          ));

                    }
                ),

            );
            _markers.add(
              Marker(
                  markerId: MarkerId('002'),
                  position: LatLng(-11.9190682,-77.0601418),
                  icon: pinLocationIcon,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Animárboles - Sinchi Roca"),
                              ),
                              body: ListView(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('El Museo de los Collis - 2019'),
                                  ),
                                  ListTile(
                                    title: Text('Escultura "Monumento a Tupac Amaru" - 2010'),
                                  ),
                                ],
                              ),
                            );
                          },
                          fullscreenDialog: true,
                        ));

                  }
              ),

            );
            _markers.add(
              Marker(
                  markerId: MarkerId('003'),
                  position: LatLng(-11.9110567,-77.0498637),
                  icon: pinLocationIcon,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return Scaffold(
                              appBar: AppBar(
                                title: Text("Huaca Don Carlos2 "),
                              ),
                              body: ListView(
                                children: <Widget>[
                                  ListTile(
                                    title: Text('Fortaleza de Collique - 2018'),
                                  ),
                                  ListTile(
                                    title: Text('Fortaleza de Tungasuca" - 2018'),
                                  ),
                                ],
                              ),
                            );
                          },
                          fullscreenDialog: true,
                        ));

                  }
              ),

            );
          });
        });
  }
}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}