import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/design_constants.dart';
import '../utilities/game_controller.dart';

class BottomNewGame extends StatelessWidget {
  const BottomNewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        Text('Choose Field Size', style: customTextStyle(30),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style:
                ElevatedButton.styleFrom(fixedSize: const Size(60, 60)),
                onPressed: () {
                  gameController.decreaseFieldSize();
                },
                child: const Icon(Icons.arrow_back_ios, size: 50)),
            const SizedBox(width: 30,),
            Text('${gameController.fieldSize}', style: customTextStyle(40)),
            const SizedBox(width: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(60, 60)),
                onPressed: () {
                  gameController.increaseFieldSize();
                },
                child: const Icon(Icons.arrow_forward_ios, size: 50))
          ],
        ),
        const SizedBox(height: 30,),
        ElevatedButton(
            onPressed: () {
              gameController.start();
            },
            child: Text('Start', style: customTextStyle(40),))
      ],
    );
  }
}