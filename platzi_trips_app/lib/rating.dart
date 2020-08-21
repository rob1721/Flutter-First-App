import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Rating extends StatelessWidget {
  double stars;
  double marginLeft;
  double fontSize;

  Rating(this.stars, this.marginLeft, this.fontSize);

  @override
  // ----------------------------------------BUILD RETURN
  Widget build(BuildContext context) {
    return getRating(stars);
  }
  // ----------------------------------------GETSTARS
  Widget getStars(double stars) {
    var icon = Icons.star;

    if (stars == 0.5) {
      icon = Icons.star_half;
    } else if(stars <= 0){
      icon = Icons.star_border;
    }

    return Container(
      margin: EdgeInsets.only(
        right: 2.0,
      ),
      child: Icon(
        icon,
        color: Color(0xFFf2c611),
        size: fontSize,
      ),
    );
  }

  // ----------------------------------------GETRATING
  Widget getRating(double stars) {
    var starList = new List<Widget>();

    for (var i=0; i<5; i++) {
      // EN CASO DE 1+ DEVUELVE STAR
      // EN CASO DE 0.5 DEVUELVE STAR_HALF
      // EN CASO DE 0 DEVUELVE STAR_BORDER
      starList.add(getStars(stars));
      stars--;
    }

    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      child: Row(
        children: starList,
      )
    );
  }

}