import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final PageController passInController;
  final int numOfIndicator;
  final Color normalColor = Colors.grey;
  final Color selectedColor = Colors.blue;
  final double size = 8.0;
  final double spacing = 4.0;

  const Indicator({this.passInController, this.numOfIndicator});

  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (passInController.page != null
            ? passInController.page.round() % pageCount
            : 0);

    return new Container(
      height: size,
      width: size + (2 * spacing),
      child: new Center(
        child: new Material(
          color: isCurrentPageSelected ? selectedColor : normalColor,
          type: MaterialType.circle,
          child: new Container(
            width: dotSize,
            height: dotSize,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(numOfIndicator, (int index) {
        return _buildIndicator(index, numOfIndicator, size, spacing);
      }),
    );
  }
}
