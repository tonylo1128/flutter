import 'package:flutter/material.dart';
import 'package:kmb/apiCall/getData/getData.dart';

class DifferentBound extends StatefulWidget {
  final passInGetBoundResult;
  final passInDroppedData;
  //below two function is passed by MainBody and need to use for "getPath()"
  final mainBodyRetrievePathResult;
  final mainBodyeRtrieveStop;

  const DifferentBound(
      {this.passInGetBoundResult,
      this.passInDroppedData,
      this.mainBodyRetrievePathResult,
      this.mainBodyeRtrieveStop});

  @override
  DifferentBoundState createState() => DifferentBoundState();
}

class DifferentBoundState extends State<DifferentBound> {
  var font20White = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.passInGetBoundResult != null
          ? Column(
              children: [
                ...(widget.passInGetBoundResult as List)
                    .map(
                      (item) => Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Container(
                                child: Row(
                              children: [
                                Container(
                                  color: Colors.red,
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  child: Text(
                                    "Bound:",
                                    style: font20White,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 0, right: 5),
                                  child: Text(
                                    item['BOUND'].toString(),
                                    style: font20White,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 0, right: 5),
                                  child: Text(
                                    "Service Type:",
                                    style: font20White,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(),
                                  child: Text(
                                    item['SERVICE_TYPE'].toString(),
                                    style: font20White,
                                  ),
                                ),
                              ],
                            )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                child: IconButton(
                                    icon: IconButton(
                                      icon: Icon(Icons.arrow_downward),
                                      onPressed: () => {
                                        getPath(
                                            widget.passInDroppedData.route,
                                            widget.mainBodyRetrievePathResult,
                                            widget.mainBodyeRtrieveStop,
                                            item['BOUND'].toString(),
                                            item['SERVICE_TYPE'].toString())
                                      },
                                    ),
                                    onPressed: null)),
                          )
                        ],
                      ),
                    )
                    .toList()
              ],
            )
          : Align(
              alignment: Alignment(0, 0),
              child: Text("Please drop a route on first page first ~",
                  style: font20White),
            ),
    );
  }
}

// http://search.kmb.hk/KMBWebSite/Function/FunctionRequest.ashx?action=getroutebound&route=31M
