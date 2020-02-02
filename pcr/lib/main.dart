// -------------------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

void main() => runApp(MyApp());




class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}


  newHelpDialog(BuildContext context){
    return (showDialog(context: context,  builder: (context) {
      return AlertDialog(
        title: Text("You've accepted the request !"),
        actions: <Widget>[
        MaterialButton(elevation: 10.0,
          child: Text("OK"),
          onPressed: (){},
        )
        ],
      );
    }));
  }

class _MyAppState extends State<MyApp> {

  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _mainLocation = const LatLng(20.463483,85.894011);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
	debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Image.asset('assets/police.jpeg', fit: BoxFit.cover),
              centerTitle: true,
              backgroundColor: Colors.blue,
              
            ),
            
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _mainLocation,
                      zoom: 15.0,
                    ),
                    markers: this.myMarker(),
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        myMapController = controller;
                      });
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child:Row(children: <Widget>[
                Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 24.0),
                        color: Colors.red,
                        child: Text("Decline", style: TextStyle(fontSize: 25.0),),
                        onPressed: (){
                          print('request decined!');
                          // declineAlert(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 24.0),
                        child: Text("Accept", style: TextStyle(fontSize: 25.0),),
                        color: Colors.green,
                        onPressed: (){
                          print('request accepted!');
                          // declineAlert(context);
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: RaisedButton(
                    //     padding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 24.0),
                    //     color: Colors.blue,
                    //     child: Text("Need Revise"),
                    //     onPressed: () => null,
                    //   ),
                    // )
                  ]
                )
            ),
            
          )
        );


  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(
          title: 'Historical City',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return _markers;
  }
}


acceptAlert(BuildContext context){
  return showDialog(context:context, builder : (context) {
      return AlertDialog( 
        title : Text("you've accepted the request!"),
        backgroundColor: Colors.green,
        );
    });
  }

  declineAlert(BuildContext context){
  return showDialog(context:context, builder : (context) {
      return AlertDialog( 
        title : Text("you've accepted the request!"),
        backgroundColor: Colors.green,
        );
    });
  }
