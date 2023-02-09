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
          height: 35,
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: fieldChangesLeftButtonStyle,
                        onPressed: () {
                          gameController.decreaseWinScore();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: SizedBox.expand(
                            child: FittedBox(
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                //    size: fieldChangesIconSize
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                        width: 50,
                        child: Center(
                            child: Text('${gameController.winScore}',
                                style: customTextStyle(30)))),
                    ElevatedButton(
                        style: fieldChangesRightButtonStyle,
                        onPressed: () {
                          gameController.increaseWinScore();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: SizedBox.expand(
                            child: FittedBox(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                //  size: fieldChangesIconSize
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                Text(
                  'Choose Field Size',
                  style: customTextStyle(20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: fieldChangesLeftButtonStyle,
                        onPressed: () {
                          gameController.decreaseFieldSize();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: SizedBox.expand(
                            child: FittedBox(
                                child: Icon(
                              Icons.arrow_back_ios_new,
                              //  size: fieldChangesIconSize
                            )),
                          ),
                        )),
                    SizedBox(
                        width: 50,
                        child: Center(
                            child: Text('${gameController.fieldSize}',
                                style: customTextStyle(30)))),
                    ElevatedButton(
                        style: fieldChangesRightButtonStyle,
                        onPressed: () {
                          gameController.increaseFieldSize();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(3.0),
                          child: SizedBox.expand(
                            child: FittedBox(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                //    size: fieldChangesIconSize
                              ),
                            ),
                          ),
                        ))
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
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(140, 60), padding: EdgeInsets.zero),
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
