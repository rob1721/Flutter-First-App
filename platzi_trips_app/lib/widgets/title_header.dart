// header generico para titulo
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleHeader extends StatelessWidget {

  //titulo
  final String title;
  // evitando el desborde de texto
  double screenWidht;
  // constructor
  TitleHeader({ Key key, @required this.title });

  @override
  Widget build(BuildContext context) {
    // evitando el desborde de texto
    screenWidht = MediaQuery.of(context).size.width;
    return Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold,
          ),
    );
  }
}