import 'package:flutter/material.dart';
import '../utilities/layout_selector.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: layoutSelector(context),
        ),
      ),
    );
  }
}