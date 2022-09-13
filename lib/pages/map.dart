import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLng;
import '../core/model/message.dart';
import '../helper/textStyle.dart';
import 'main/myApp.dart';
import 'package:quiver/async.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as mapt;

class map extends  StatefulWidget {

  @override
  _map createState() {
    return _map();
  }
}

class _map extends State<map> {
  @override
  int _start = 20;
  int _current = 10;
  var l = latLng.LatLng(35.651, 51.322);
  var b = false;

  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        l.latitude = l.latitude - 0.0005;
        l.longitude = l.longitude - 0.0002;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }
  var polygones = <Polygon>[
    Polygon(points: [
      latLng.LatLng(35.65503590264662, 51.31999539733471),
      latLng.LatLng(35.655492058754575, 51.32108784364813),
      latLng.LatLng(35.65600985442262, 51.32207407990326),
      latLng.LatLng(35.65667558677728, 51.32366723077698),
      latLng.LatLng(35.65714406177431, 51.324896232879574),
      latLng.LatLng(35.65681119824324, 51.32506313439967),
      latLng.LatLng(35.65658928845178, 51.324774849955865),
      latLng.LatLng(35.656404363154536, 51.32474450422494),
      latLng.LatLng(35.65552904427078, 51.32500244293781),
      latLng.LatLng(35.6547893306927, 51.325336245978015),
      latLng.LatLng(35.65435782794164, 51.32551832036358),
      latLng.LatLng(35.65361810351614, 51.32591281486565),
      latLng.LatLng(35.652076988959166, 51.32706595264092),
      latLng.LatLng(35.65065913730529, 51.32803701603058),
      latLng.LatLng(35.64931523728885, 51.328674276380056),
      latLng.LatLng(35.647416477628305, 51.32890186936205),
      latLng.LatLng(35.64686163673967, 51.3273694099502),
      latLng.LatLng(35.64808228160819, 51.32642869229143),
      latLng.LatLng(35.64874808003918, 51.324380355453805),
      latLng.LatLng(35.649438531810304, 51.32214994423061),
      latLng.LatLng(35.651546838677895, 51.320647830549646),
      latLng.LatLng(35.65041255183995, 51.32428931826102),
      latLng.LatLng(35.650572832479014, 51.32530590024709),
      latLng.LatLng(35.65171944613254, 51.32410724387545),
      latLng.LatLng(35.6526317936251, 51.32343963779503),
      latLng.LatLng(35.65344550016439, 51.32248374727082),
      latLng.LatLng(35.654382485304495, 51.3212699180337),
      latLng.LatLng(35.65503590264662, 51.32007126166206),

    ],
        borderColor: Colors.blue,
        borderStrokeWidth: 1,
        color: Color.fromRGBO(255, 0, 0, 0.2)),
    Polygon(points: [
      latLng.LatLng(35.62, 51.32),
      latLng.LatLng(35.62, 51.31),
      latLng.LatLng(35.61, 51.31),
      latLng.LatLng(35.61, 51.32),
    ],
        borderColor: Colors.red,
        borderStrokeWidth: 1,
        color: Colors.blue,
        disableHolesBorder: true,
        isDotted: true
    ),
    Polygon(points: [
      latLng.LatLng(35.60, 51.32),
      latLng.LatLng(35.60, 51.31),
      latLng.LatLng(35.59, 51.31),
      latLng.LatLng(35.59, 51.32),
    ],
        borderColor: Colors.red,
        borderStrokeWidth: 1,
        color: Colors.blue,
        disableHolesBorder: true,
        isDotted: true
    ),
    //----------------//
    Polygon(points: [
      latLng.LatLng(40.58, 31.78),
      latLng.LatLng(40.58, 31.77),
      latLng.LatLng(40.57, 31.77),
      latLng.LatLng(40.57, 31.78),
    ],
        borderColor: Colors.blue,
        borderStrokeWidth: 1,
        color: Colors.red),
    Polygon(points: [
      latLng.LatLng(40.56, 31.78),
      latLng.LatLng(40.56, 31.77),
      latLng.LatLng(40.55, 31.77),
      latLng.LatLng(40.55, 31.78),
    ],
        borderColor: Colors.red,
        borderStrokeWidth: 1,
        color: Colors.blue),
  ];
//http://193.141.126.149:8080/geoserver/kama/wms?service=WFS&version=1.0.0&request=GetFeature&typeName=kama:NamakabrudBoundry&outputFormat=application/json&srsname=EPSG:3857
  /// using even-odd rule algorithm
  bool isGeoPointInPolygon(latLng.LatLng l) {
    var distanceBetweenPoints = mapt.SphericalUtil.computeDistanceBetween(
        mapt.LatLng(51.5073509, -0.1277583),
        mapt.LatLng(48.856614, 2.3522219)
    );

    var t=[
      mapt.LatLng(35.65503590264662, 51.31999539733471),
      mapt.LatLng(35.655492058754575, 51.32108784364813),
      mapt.LatLng(35.65600985442262, 51.32207407990326),
      mapt.LatLng(35.65667558677728, 51.32366723077698),
    ];
    print('distanceBetweenPoints ${distanceBetweenPoints}');

    var isInPolygon = false;
    var point = mapt.LatLng(l.latitude, l.longitude);
    polygones.asMap().forEach((index, polygon)  {
      var t = <mapt.LatLng>[];

      polygon.points.forEach((p)  {
        t.add(mapt.LatLng(p.latitude,p.longitude));
      });
      var containsLocation = mapt.PolygonUtil.containsLocation(point, t, true);
      if(containsLocation)
      // for (var i = 0, j = polygon.points.length - 1; i < polygon.points.length; j = i++) {
        // if ((((polygon.points[i].latitude <= l.latitude) &&
        //     (l.latitude < polygon.points[j].latitude)) ||
        //     ((polygon.points[j].latitude <= l.latitude) &&
        //         (l.latitude < polygon.points[i].latitude))) &&
        //     (l.longitude <
        //         (polygon.points[j].longitude - polygon.points[i].longitude) *
        //             (l.latitude - polygon.points[i].latitude) /
        //             (polygon.points[j].latitude - polygon.points[i].latitude) +
        //             polygon.points[i].longitude))
        {
        var f = mapt.SphericalUtil.computeArea(t);
        isInPolygon = !isInPolygon;
        print('${index}/${f}');
        // break;
        }
      // }
    });

    return isInPolygon;
  }

  final MapController _mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return

      Scaffold(body:Stack(
          children: <Widget>[
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                // center: latLng.LatLng(35.651, 51.322),
                // bounds:
                // LatLngBounds(latLng.LatLng(58, 6.1), latLng.LatLng(58.2, 6.2)),
                // boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0),zoom: 10,inside: true),
                // swPanBoundary: latLng.LatLng(58, 6.1),
                // nePanBoundary: latLng.LatLng(58.2, 6.2),
                onTap: (l,t){
                  print('ssw:${_mapController.bounds?.south}');
                  print('s: ${isGeoPointInPolygon(t)}');
                  // print('latLng.LatLng(${t.latitude}, ${t.longitude}),');
                },
                center: latLng.LatLng(35.641, 51.322),
                // center: latLng.LatLng(40.58, 31.78),
                minZoom: 10.0,
                maxZoom: 18.0,
                zoom: 14
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                  "https://snowmap.fast-sfc.com/pistes/{z}/{x}/{y}.png",
                  //change base_snow_map to pistes
                  subdomains: ['a', 'b', 'c'],
                  backgroundColor: Colors.transparent,
                ),

                PolygonLayerOptions(
                    polygons:polygones
                ),
                CircleLayerOptions(circles: <CircleMarker>[
                  CircleMarker(
                      point: latLng.LatLng(35.62, 51.32),
                      color: Colors.blue.withOpacity(0.7),
                      borderStrokeWidth: 2,
                      useRadiusInMeter: true,
                      radius: 200 // 2000 meters | 2 km
                  ),
                ]),
                PolylineLayerOptions(
                    polylines:  [
                      Polyline(points:[
                        latLng.LatLng(35.63, 51.32),
                        latLng.LatLng(35.63, 51.31),
                        latLng.LatLng(35.62, 51.30),
                      ],
                        strokeWidth: 2,
                        color: Colors.blue,)
                    ]
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 50.0,
                      height: 50.0,
                      point:l,
                      builder: (ctx) =>
                          Container(
                              child: InkWell(
                                onTap: () {
                                  print(ctx.size);
                                }, // Image tapped
                                child:FlutterLogo(),
                              )
                          ),
                    ),
                  ],
                ),
              ],
              children: <Widget>[
                TileLayerWidget(options: TileLayerOptions(
                    urlTemplate:  b?"https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    :"https://snowmap.fast-sfc.com/base_snow_map/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']

                )),
                MarkerLayerWidget(options: MarkerLayerOptions(
                  markers: [

                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: latLng.LatLng(35.641, 51.322),
                      builder: (ctx) =>
                          Container(
                              child: InkWell(
                                onTap: () {
                                  print(ctx.toString());
                                }, // Image tapped
                                child:FlutterLogo(),
                              )
                          ),
                    ),
                  ],
                )),
              ],
            ),
            Positioned(
                left: 30.0,
                top: 30.0,
                child: new Container(
                    decoration: new BoxDecoration(color: Colors.red),
                    child:
                    ElevatedButton(

                      child:
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:Center( child:Text('تغییر',)),
                      ),
                      onPressed: ()=>  setState(() {b=!b;}),
                      style: ElevatedButton.styleFrom(
                        primary: MyApp.color.base,
                        textStyle: Style.h4(color: Colors.white),
                      ),
                    )
                )
            ),

          ])
      );
  }

  Future<void> errorMessage(error) async {
    MyApp.events.streamMessage.add(Message.info(
        msg: 'اینترنت شما قطع میباشد '
            '\n بعد از اطمینان از اتصال اینترنت مجددا تلاش نماید '
            '\n در صورت عدم رفع مشکل آن را گزارش کنید'
    ));
  }

}
