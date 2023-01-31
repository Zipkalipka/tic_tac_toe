import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: const [TurnBox(),
            SizedBox(height: 30),
            GameBoard()],
        ),
      ),
    );
  }
}

class TurnBox extends StatefulWidget {
  const TurnBox({Key? key}) : super(key: key);

  @override
  State<TurnBox> createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Player UNO', style: TextStyle(fontSize: 50),),
    );
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 300,
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ElevatedButton(onPressed:() {}, child: Text('A')),
          ElevatedButton(onPressed:() {}, child: Text('B')),
          ElevatedButton(onPressed:() {}, child: Text('C')),
          ElevatedButton(onPressed:() {}, child: Text('D')),
          ElevatedButton(onPressed:() {}, child: Text('E')),
          ElevatedButton(onPressed:() {}, child: Text('F')),
          ElevatedButton(onPressed:() {}, child: Text('G')),
          ElevatedButton(onPressed:() {}, child: Text('H')),
          ElevatedButton(onPressed:() {}, child: Text('I')),
        ],
      ),
    );
  }
}

class GameTile extends StatefulWidget {
  const GameTile({Key? key}) : super(key: key);

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
