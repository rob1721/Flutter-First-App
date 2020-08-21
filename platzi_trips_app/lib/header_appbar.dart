import 'package:flutter/material.dart';

import 'gradient_background.dart';
import 'card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBackground("Welcome"),
        CardImageList(),
      ],
    );
  }
}