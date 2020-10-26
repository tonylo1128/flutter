import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kmb/apiCall/getData/ChallengeDataJson.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListAction.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'package:kmb/redux/buttonAvailabilityList/UpdateButtonListAction.dart';
import 'package:kmb/redux/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'MainBody.dart';
import 'CusDrawer.dart';
import 'CusSearch.dart';
import 'NetworkCheck.dart';
import 'SearchTextField.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  // NetworkCheck temp = NetworkCheck();
  // temp.check();

  bool searching = false;
  List<ChallengeData> result = [];

  void retrieveResult(resultFromChildWidget) {
    setState(() => {result = resultFromChildWidget});
    print(result.length);
  }

  dispatchAction(inputList) {
    StoreProvider.of<ButtonListState>(context)
        .dispatch(ButtonListAction(inputList));
    super.dispose();
  }

  dispatchUpdateAction(inputIndex) {
    StoreProvider.of<UpdateButtonListAction>(context)
        .dispatch(UpdateButtonListAction(inputIndex));
    super.dispose();
  }

  changeSearchingState() {
    if (mounted) {
      setState(() {
        searching = !searching;
      });
    }
  }

  var route;
  var bound;
  var timeResult;

  retrieveRouteInfo(routeInput) {
    print("I am CALLING THE retrieveRouteInfo" + routeInput);
    setState(() {
      route = routeInput;
    });
  }

  retrieveBoundInfo(boundInput) {
    print("Testinggggggggg lolllllll");
    print(boundInput);
    setState(() {
      bound = boundInput;
    });
  }

  retrieveTimeResult(timeResult) {
    print("I am CALLING THE Time  Resulttttt");
    print(timeResult);
    setState(() {
      this.timeResult = timeResult;
    });
    saveDataLocally();
  }

  saveDataLocally() async{
    final prefs = await SharedPreferences.getInstance();
    final key = route+bound[0]+bound[1];
    print("check check the key !!!!");
    print(key);
    final value= [route, bound, timeResult].toString();
    print("Testing the string here !!!");
    print(value);
    prefs.setString(key, value);

    var printValue = prefs.getString(key);
    print("Testing new fucntion here !!!");
    print(printValue);
    print(prefs.getKeys());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: searching ? Colors.redAccent : Colors.black,
        title: searching
            ? SearchTextField(passInFunction: retrieveResult)
            : new Text("KMBPJ"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {
              changeSearchingState(),
            },
          )
        ],
      ),
      drawer: CusDrawer(
          passInRoute: route, passInBound: bound, passInTimeResult: timeResult),
      body: MainBody(
          passInData: result,
          passIndispatchAction: dispatchAction,
          passIndispatchUpdateAction: dispatchUpdateAction,
          passInRetrieveRouteInfo: retrieveRouteInfo,
          passInRetrieveBoundInfo: retrieveBoundInfo,
          passInRetrieveTimeResult: retrieveTimeResult),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
