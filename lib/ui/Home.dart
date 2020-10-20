import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kmb/apiCall/getData/ChallengeDataJson.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListAction.dart';
import 'package:kmb/redux/buttonAvailabilityList/ButtonListState.dart';
import 'package:kmb/redux/buttonAvailabilityList/UpdateButtonListAction.dart';
import 'package:kmb/redux/store.dart';
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
      drawer: CusDrawer(),
      body: MainBody(
        passInData: result,
        passIndispatchAction: dispatchAction,
        passIndispatchUpdateAction: dispatchUpdateAction,
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
