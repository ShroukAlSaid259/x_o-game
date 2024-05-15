import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnScreen extends StatelessWidget {
  String text;
  int index;
  Function callBack;

  BtnScreen(this.text, this.callBack, this.index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
          onPressed: () {
            callBack(index);
          },
          child: Text(
            "$text",
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          color: Colors.purpleAccent[100]),
    );
  }
}
