// esto es parecido a un form
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {

  // el texto q está en un form para tener una pista de q escribir..se le llama hint
  final String hintText; // texto flotante
  final TextInputType inputType; // tipo a añadir
  final TextEditingController controller; // trabajando formulario
  int maxLines = 1; // maximo de lineas

  TextInput({
    Key key,
    @required this.hintText,
    @required this.inputType,
    @required this.controller,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 20.0,
        left: 20.0,
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType, //tipo de input a poner
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 15.0,
          fontFamily: "Lato",
          color: Colors.blueGrey,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          filled: true, //q pueda ser llenado
          fillColor: Color(0xFFe5e5e5),
          border: InputBorder.none, // para q sea FLAT
          hintText: hintText, // texto flotante
          enabledBorder: OutlineInputBorder( // borde del form
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0)
            ),
            
          ),
          focusedBorder: OutlineInputBorder(
            // quitando el color negro del borde y poniendo el mismo q el fondo del form
            borderSide: BorderSide(color: Color(0xFFe5e5e5)),
            borderRadius: BorderRadius.all(
              Radius.circular(9.0)
            ),
          )
        ),
      ),
    );
  }
}