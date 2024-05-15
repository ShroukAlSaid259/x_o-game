import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o/player_data.dart';
import 'package:x_o/x-o_btn.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'game';

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> gameBord = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Scoor = 0;
  int player2Scoor = 0;

  @override
  Widget build(BuildContext context) {
    PlayerDataArgs args=ModalRoute.of(context)?.settings.arguments as PlayerDataArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text("X-O"),
        backgroundColor: Colors.purpleAccent[100],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.name1} (X)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "$player1Scoor",
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${args.name2} (O)",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text("$player2Scoor",
                        style: Theme.of(context).textTheme.headlineLarge)
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BtnScreen(gameBord[0], onBtnClick, 0),
                BtnScreen(gameBord[1], onBtnClick, 1),
                BtnScreen(gameBord[2], onBtnClick, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BtnScreen(gameBord[3], onBtnClick, 3),
                BtnScreen(gameBord[4], onBtnClick, 4),
                BtnScreen(gameBord[5], onBtnClick, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BtnScreen(gameBord[6], onBtnClick, 6),
                BtnScreen(gameBord[7], onBtnClick, 7),
                BtnScreen(gameBord[8], onBtnClick, 8),
              ],
            ),
          )
        ],
      ),
    );
  }
  void initGameBoard(){
    gameBord = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
  }

  int counter = 0;
  void onBtnClick(index) {
    if (gameBord[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      gameBord[index] = "X";
      player1Scoor += 2;
      bool winner = checkWinner('X');
      if (winner) {
        player1Scoor += 10;
        initGameBoard();
      }
    } else {
      gameBord[index] = "O";
      player2Scoor += 2;
      bool winner = checkWinner('O');
      if (winner) {
        player2Scoor += 10;
        initGameBoard();
      }
    }
    counter++;

    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      // Check Row
      if (gameBord[i] == symbol &&
          gameBord[i + 1] == symbol &&
          gameBord[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i += 3) {
      // Check Column
      if (gameBord[i] == symbol &&
          gameBord[i + 3] == symbol &&
          gameBord[i + 6] == symbol) {
        return true;
      }
    }
    if (gameBord[0] == symbol &&
        gameBord[4] == symbol &&
        gameBord[8] == symbol) {
      return true;
    }
    if (gameBord[2] == symbol &&
        gameBord[4] == symbol &&
        gameBord[6] == symbol) {
      return true;
    }
    return false;
  }
}
