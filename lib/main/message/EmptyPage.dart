import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  final String emptyMsg;

  EmptyPage(this.emptyMsg);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(emptyMsg,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          )),
    );
  }
}
