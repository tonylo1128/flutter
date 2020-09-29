import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:proj4dart/proj4dart.dart';
// proj4.defs("EPSG:2326","+proj=tmerc +lat_0=22.31213333333334 +lon_0=114.1785555555556 +k=1 +x_0=836694.05 +y_0=819069.8 +ellps=intl +towgs84=-162.619,-276.959,-161.764,0.067753,-2.24365,-1.15883,-1.09425 +units=m +no_defs");
// proj4.defs("EPSG:4326", "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ")

LatLng convertCoord(input) {
  var src = Projection.add("EPSG:2326",
      "+proj=tmerc +lat_0=22.31213333333334 +lon_0=114.1785555555556 +k=1 +x_0=836694.05 +y_0=819069.8 +ellps=intl +towgs84=-162.619,-276.959,-161.764,0.067753,-2.24365,-1.15883,-1.09425 +units=m +no_defs");
  var dst = Projection('EPSG:4326');

  var target = Point(x: input[0], y: input[1]);
  var pointForward = src.transform(dst, target);

  return LatLng(pointForward.y, pointForward.x);
}

// var dst = Projection.add(
//     "EPSG:4326", "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs ");
