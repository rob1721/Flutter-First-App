import 'package:flutter/material.dart';

import 'package:platzi_trips_app/Place/ui/widgets/description_place.dart';
import 'header_appbar.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review_list.dart';

// ignore: must_be_immutable
class HomeTrips extends StatelessWidget {

  String descriptionDummy = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquid ex ea commodi consequat.\n\nQuis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Stack( // pon uno encima de otro
          children: <Widget>[
            ListView(
              children: <Widget>[
                // DescriptionPlace está sobre ReviewList
                DescriptionPlace("Bahamas", 5, descriptionDummy),
                ReviewList()

              ],
            ),
            //a grandes rasgos nuestro appbar
            //es nuestro gradiente
            HeaderAppBar(),
          ],
        );
  }
  
}