// Flutter code sample for CustomScrollView

// By default, if items are inserted at the "top" of a scrolling container like
// [ListView] or [CustomScrollView], the top item and all of the items below it
// are scrolled downwards. In some applications, it's preferable to have the
// top of the list just grow upwards, without changing the scroll position.
// This example demonstrates how to do that with a [CustomScrollView] with
// two [SliverList] children, and the [CustomScrollView.center] set to the key
// of the bottom SliverList. The top one SliverList will grow upwards, and the
// bottom SliverList will grow downwards.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<int> top = [];
  List<int> bottom = [0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey('bottom-sliver-list');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
          },
        ),
      ),
      body: CustomScrollView(
        center: centerKey,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + top[index] % 4 * 100],
                  height: 100 + top[index] % 4 * 20.0,
                  child: Text('Item: ${top[index]}'),
                );
              },
              childCount: top.length,
            ),
          ),
          SliverList(
            key: centerKey,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + bottom[index] % 4 * 100],
                  height: 100 + bottom[index] % 4 * 20.0,
                  child: Text('Item: ${bottom[index]}'),
                );
              },
              childCount: bottom.length,
            ),
          ),
        ],
      ),
    );
  }
}
