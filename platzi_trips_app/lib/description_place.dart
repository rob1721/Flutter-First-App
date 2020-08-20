import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionPlace extends StatelessWidget {

  String descriptionDummy = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id nisl in ex eleifend mattis. Sed in auctor risus. Aliquam a viverra justo. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n\nDonec sit amet odio eget lorem lobortis blandit. Proin pulvinar mi sed lorem hendrerit, vitae feugiat nunc rhoncus";

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

    // declarando las estrellas
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
            descriptionDummy,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            textAlign: TextAlign.left,
          ),
        )
    );
    
    Container(
      
      );

    final titleStars = Row (
      children: <Widget>[
        Container (
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            "Robertobleh",
            style: TextStyle(
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
            star,
            star
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
