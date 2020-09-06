import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {

  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
    Key key,
    @required this.iconData,
    @required this.onPressed
  });

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  //----------------------------------------VAR
  //bool _pressed = false;
  /*
  void onPressedFav(){
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("Agregaste a tus Favoritos"),
        )
    );
  }*/
  //----------------------------------------build
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true, // tamaño mini
      tooltip: "Fav", // mouse posicion
      // widget para stateful
      onPressed: widget.onPressed, // comportamiento al apretar
      child: Icon(
        widget.iconData,
      ),
      // al haber mas de un action button..implementar herotag
      heroTag: null,
    );
  }

//----------------------------------------onPressed
  /*void onPressedFav(){
    setState(() {
      _pressed = !this._pressed;
    });
    Scaffold.of(context).showSnackBar(
          SnackBar(

              content: this._pressed ? Text("Fav Added...") : Text("Fav Deleted..."),
            
          )
        );
  }*/
}