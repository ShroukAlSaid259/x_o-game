import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:x_o/game.dart';
import 'package:x_o/player_data.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.purpleAccent[100],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Player one'),
              onChanged: (value) {
                player1Name = value;
                print(value);
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Player two'),
              onChanged: (value) {
                player2Name = value;
                print(value);
              },
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              color: Colors.purpleAccent[100],
              onPressed: () {
                Navigator.pushNamed(context, GameScreen.routeName,arguments: PlayerDataArgs(player1Name,player2Name));
              },
              child: Text("Let\s Gooo!"),
            )
          ],
        ),
      ),
    );
  }
}
