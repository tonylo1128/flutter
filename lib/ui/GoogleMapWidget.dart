import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  final passInPathList;
  const GoogleMapWidget({this.passInPathList});

  @override
  GoogleMapWidgetState createState() => GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget>
    with AutomaticKeepAliveClientMixin {
  GoogleMapController mapController;
  var _center = LatLng(22.395264, 114.125875);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      polylines: widget.passInPathList,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: widget.passInPathList != null
            ? widget.passInPathList.elementAt(0).points[
                (widget.passInPathList.elementAt(0).points.length / 2).round()]
            : _center,
        zoom: 11.0,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
