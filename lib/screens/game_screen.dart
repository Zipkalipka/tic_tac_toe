import 'package:flutter/material.dart';
import '../utilities/layout_selector.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

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