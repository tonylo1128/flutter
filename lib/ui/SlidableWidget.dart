import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kmb/ui/SlideActionBtn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'RecordCard.dart';

class SlidableWidget extends StatefulWidget {
  final passInLoopingItem;

  SlidableWidget({this.passInLoopingItem});

  @override
  _SlidableWidgetState createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  var temps;
  var prefs;

  initFunc() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initFunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(widget.passInLoopingItem.route +
          widget.passInLoopingItem.bound +
          widget.passInLoopingItem.serviceType),
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.25,
      child: RecordCard(passInPharsedResultItem: widget.passInLoopingItem),
      secondaryActions: <Widget>[
        SlideActionBtn(
          passInButtonType: "Delete",
          passInIcon: Icons.delete,
        )
      ],
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          temps = prefs.getKeys().toList();
          for (var i in temps) {
            if (i ==
                widget.passInLoopingItem.route.toString() +
                    widget.passInLoopingItem.bound.toString() +
                    widget.passInLoopingItem.serviceType.toString()) {
              prefs.remove(i);
            }
          }

          // print(actionType);
          return Fluttertoast.showToast(
              msg: "Deleted !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 16.0);
        },
      ),
    );
  }
}
