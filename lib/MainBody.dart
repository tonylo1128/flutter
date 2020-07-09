import 'package:flutter/material.dart';
import 'KmbCard.dart';

class MainBody extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            KmbCard(),
            Text("DLLM"),
          ],
        ),
      ),
    );
  }
}
