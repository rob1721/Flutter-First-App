import 'package:flutter/material.dart';
import 'rating.dart';

// ignore: must_be_immutable
class Review extends StatelessWidget {
// -----------------------------------VAR DECLARADAS
  String pathImage;
  String name;
  String details;
  double stars;
  String comment;

  // constructor
  Review(this.pathImage, this.name, this.details, this.comment, this.stars);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build

// -----------------------------------COMMENT
    final userComment = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),

      child: Text(
        comment,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          fontWeight: FontWeight.w900,
          //color: Color(0xFFa3a5a7),
        ),
      ),
    );

// -----------------------------------INFO
    final userInfo = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 20.0
          ),

          child: Text(
            details,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: "Lato",
              fontSize: 13.0,
              color: Color(0xFFa3a5a7),
            ),
          ),
        ),
        // agregamos las estrellas
        Rating(stars, 5.0, 14.0),
      ],
    );
    

// -----------------------------------NAME    
    final userName = Container(
      margin: EdgeInsets.only(
        left: 20.0
      ),

      child: Text(
        name,
        textAlign: TextAlign.left,
        // ASIGNACION REGULAR 
        // A NUEVAS FONTS
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 15.0,
        ),
      ),
    );

// -----------------------------------DETAILS
    // agrupando todo lo relacionado en userDetails
    final userDetails = Column(
      // alineando al inicio
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // se agrupan de modo q
        // quede igual al diseño
        userName,
        userInfo,
        userComment,
      ]
    );
// -----------------------------------POSICION FOTO
    final photo = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),

      width: 80.0,
      height: 80.0,
      // Decoracion borde foto// Widget
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // imagen
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage),
        ),
      ),
    );

// -----------------------------------EXPORT
    return Row(
      children: <Widget>[
        photo,
        userDetails
      ],
    );
  }
}