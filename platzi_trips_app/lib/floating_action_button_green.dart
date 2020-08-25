import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  //----------------------------------------VAR
  bool _pressed = false;

  //----------------------------------------build
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true, // tamaño mini
      tooltip: "Fav", // mouse posicion
      onPressed: onPressedFav, // comportamiento al apretar
      child: Icon(
        this._pressed ? Icons.favorite : Icons.favorite_border
      ),
    );
  }

//----------------------------------------onPressed
  void onPressedFav(){
    setState(() {
      _pressed = !this._pressed;
    });
    Scaffold.of(context).showSnackBar(
          SnackBar(

              content: this._pressed ? Text("Fav Added...") : Text("Fav Deleted..."),
            
          )
        );
  }
}