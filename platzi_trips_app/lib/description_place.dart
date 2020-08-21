import 'package:flutter/material.dart';
// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {

  String namePlace;
  int stars;
  String descriptionPlace;

  // constructor
  DescriptionPlace(this.namePlace, this.stars, this.descriptionPlace);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    //-------------------declarando las estrellas
    final star = Container( // margenes
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star,
        color: Color(0xFFf2c611), // color hex
      ),
    );

    final starHalf = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star_half,
        color: Color(0xFFf2c611),
      ),
    );

    // -------------------------------STARBORDER
    final starBorder = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),

      child: Icon(
        Icons.star_border,
        color: Color(0xFFf2c611),
      ),
    );
    // -------------------------------DESCRIPTION
    final description = Align(
      alignment: Alignment.centerLeft,
      child:
        Container(
          margin: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Text(
            descriptionPlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              // color: Colors.grey,
            ),
            textAlign: TextAlign.left,
          ),
        )
    );
    
   /* Container(
      
      );*/
    final titleStars = Row (
     
      children: <Widget>[
        
        Container (
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            namePlace,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,

          ),
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            starHalf,
            starBorder
          ]
        )

      ],
      
    );

    return Column( // acá es donde se asignan las columnas
      children: <Widget>[
        titleStars,
        description,
      ]
    );
  }
  
}
