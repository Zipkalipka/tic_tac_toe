import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utilities/design_constants.dart';
import '../../utilities/game_controller.dart';

class BottomNewGame extends StatelessWidget {
  const BottomNewGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameController gameController = Provider.of<GameController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  'Victory Score',
                  style: customTextStyle(20),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: fieldChangesLeftButtonStyle,
                        onPressed: () {
                          gameController.decreaseWinScore();
                        },
                        child: const Icon(Icons.arrow_back_ios, size: fieldChangesIconSize)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${gameController.winScore}', style: customTextStyle(20)),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: fieldChangesRightButtonStyle,
                        onPressed: () {
                          gameController.increaseWinScore();
                        },
                        child: const Icon(Icons.arrow_forward_ios, size: fieldChangesIconSize))
                  ],
                ),
              ],
            ),
            const SizedBox(width: 30,),
            Column(
              children: [
                Text(
                  'Choose Field Size',
                  style: customTextStyle(20),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: fieldChangesLeftButtonStyle,
                        onPressed: () {
                          gameController.decreaseFieldSize();
                        },
                        child: const Icon(Icons.arrow_back_ios, size: fieldChangesIconSize)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${gameController.fieldSize}', style: customTextStyle(20)),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: fieldChangesRightButtonStyle,
                        onPressed: () {
                          gameController.increaseFieldSize();
                        },
                        child: const Icon(Icons.arrow_forward_ios, size: fieldChangesIconSize))
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(fixedSize: const Size(140, 60),padding: EdgeInsets.zero),
            onPressed: () {
              gameController.start();
            },
            child: Text(
              'Start',
              style: customTextStyle(40),
            ))
      ],
    );
  }
}
