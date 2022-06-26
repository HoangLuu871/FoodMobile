import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;
  final Color color2;

  StarRating({this.starCount = 5, this.rating = .0, required this.color, required this.color2});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: color2,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)));
  }
}