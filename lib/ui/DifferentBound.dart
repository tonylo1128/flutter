import 'package:flutter/material.dart';

import 'package:kmb/apiCall/getData/getData.dart';
// import 'package:kmb/redux/buttonAvailabilityList/buttonListAction.dart';
import 'package:kmb/redux/reduxFileimport.dart';
import 'package:kmb/redux/states.dart';
import 'package:kmb/redux/store.dart';

class DifferentBound extends StatefulWidget {
  final passInGetBoundResult;
  final passInDroppedData;
  //below two function is passed by MainBody and need to use for "getPath()"
  final mainBodyRetrievePathResult;
  final mainBodyeRtrieveStop;

  final passInPageController;
  final passInBoundBasicInfo;
  //used for reset the timer result list when user click the get bound putton
  final passInResetTimeResult;

  //used for rest the value in PathTimer value
  final passInResetAssignToChildGorbalTime;

  final Function passPassIndispatchAction;

  const DifferentBound(
      {this.passInGetBoundResult,
      this.passInDroppedData,
      this.mainBodyRetrievePathResult,
      this.mainBodyeRtrieveStop,
      this.passInPageController,
      this.passInBoundBasicInfo,
      this.passInResetTimeResult,
      this.passInResetAssignToChildGorbalTime,
      this.passPassIndispatchAction});

  @override
  DifferentBoundState createState() => DifferentBoundState();
}

class DifferentBoundState extends State<DifferentBound>
    with AutomaticKeepAliveClientMixin {
  bool firstTime = true;

  var font20White = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );

  var retrieveStopFromDifferentBound;
  passInRetrieveStopFromDifferentBound(input) {
    setState(() {
      retrieveStopFromDifferentBound = input;
    });
  }

  dispatchButtonListAction() {
    final store = StoreProvider.of<ButtonListState>(context);
    store.dispatch(ButtonListAction(retrieveStopFromDifferentBound));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.passInGetBoundResult != null
          ? Column(
              children: [
                ...(widget.passInGetBoundResult as List)
                    .map((item) => Column(
                          children: [
                            // the starting point and destination;
                            widget.passInBoundBasicInfo != null
                                ? Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          widget.passInBoundBasicInfo[widget
                                              .passInGetBoundResult
                                              .indexOf(item)][0],
                                          style: font20White,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Text(
                                          widget.passInBoundBasicInfo[widget
                                              .passInGetBoundResult
                                              .indexOf(item)][1],
                                          style: font20White,
                                        ),
                                      )
                                    ],
                                  )
                                : Text("Nth in here la"),

                            // the "Bound:$num Service Type:$num" widget

                            Row(
                              children: [
                                Expanded(
                                  flex: 9,
                                  child: Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        color: Colors.red,
                                        margin:
                                            EdgeInsets.only(left: 10, right: 5),
                                        child: Text(
                                          "Bound:",
                                          style: font20White,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 5),
                                        child: Text(
                                          item['BOUND'].toString(),
                                          style: font20White,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 5),
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
                                      highlightColor: Colors.red,
                                      color: Colors.blue,
                                      icon: Icon(Icons.arrow_downward),
                                      onPressed: () async => {
                                        await widget.passInResetTimeResult(),
                                        firstTime
                                            ? print(
                                                "This isssssssssssssssssssssssssss the first time ar")
                                            : await widget
                                                .passInResetAssignToChildGorbalTime(),
                                        firstTime = false,
                                        await getPath(
                                          widget.passInDroppedData.route,
                                          widget.mainBodyRetrievePathResult,
                                          widget.mainBodyeRtrieveStop,
                                          item['BOUND'].toString(),
                                          item['SERVICE_TYPE'].toString(),
                                          passInRetrieveStopFromDifferentBound,
                                        ),

                                        dispatchButtonListAction(),

                                        // await widget.passPassIndispatchAction(
                                        //     retrieveStopFromDifferentBound),

                                        // await store.dispatch(
                                        //   new ButtonListAction(
                                        //       retrieveStopFromDifferentBound),
                                        // ),

                                        // StoreProvider.of<ButtonListState>(
                                        //         context)
                                        //     .dispatch(ButtonListAction(
                                        //         retrieveStopFromDifferentBound)),
                                        print(
                                            "testing and see the store@@@@@${store.state.availableList}"),
                                        if (widget
                                            .passInPageController.hasClients)
                                          {
                                            widget.passInPageController
                                                .animateToPage(
                                              2,
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              curve: Curves.easeInOut,
                                            )
                                          }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Colors.white,
                              thickness: 1,
                              indent: 5,
                              endIndent: 5,
                            ),
                          ],
                        ))
                    .toList(),
              ],
            )
          : Align(
              alignment: Alignment(0, 0),
              child: Text("Please drop a route on first page first ~",
                  style: font20White),
            ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

// http://search.kmb.hk/KMBWebSite/Function/FunctionRequest.ashx?action=getroutebound&route=31M
