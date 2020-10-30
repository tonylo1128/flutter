import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

class SlideActionBtn extends StatefulWidget {
  final passInButtonType;
  final passInIcon;

  SlideActionBtn({this.passInButtonType, this.passInIcon});

  @override
  _SlideActionBtnState createState() => _SlideActionBtnState();
}

class _SlideActionBtnState extends State<SlideActionBtn> {
  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
        caption: widget.passInButtonType,
        color: Colors.redAccent,
        icon: widget.passInIcon,
        onTap: () => {
              //this will call the onDismissed func in SlidableWidget
              Slidable.of(context).dismiss(),
            });
  }
}
