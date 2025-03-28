import 'package:flutter/material.dart';
import 'package:my_app/consttants.dart';

class BookRating extends StatelessWidget {
  final double score;
  final double size;

  const BookRating({
    required Key key,
    required this.score,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 7),
            blurRadius: 20,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: List.generate(5, (index) {
              if (index < score.floor()) {
                return Icon(Icons.star, color: kIconColor, size: size);
              } else if (index == score.floor() && score % 1 != 0) {
                return Icon(Icons.star_half, color: kIconColor, size: size);
              }
              return Icon(Icons.star_border, color: kIconColor, size: size);
            }),
          ),
          SizedBox(height: 5),
          Text(
            score.toString(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
