import 'package:flutter/material.dart';
import 'review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/img/2.jpg", "Roberto Valenzuela", "1 review ~ 5 photos", "me encantó", 4.5),
        Review("assets/img/3.jpg", "Byron Guerrero", "2 review ~ 4 photos", "ni fu ni fa", 3),
        Review("assets/img/4.jpg", "Felipe Concha", "3 review ~ 3 photos", "vale hongo el lugar", 1.5),
        Review("assets/img/4.jpg", "Felipe Concha", "3 review ~ 3 photos", "vale hongo el lugar", 1.5),
        Review("assets/img/4.jpg", "Felipe Concha", "3 review ~ 3 photos", "vale hongo el lugar", 1.5),
        Review("assets/img/4.jpg", "Felipe Concha", "3 review ~ 3 photos", "vale hongo el lugar", 1.5),
      ],
    );
  }

}