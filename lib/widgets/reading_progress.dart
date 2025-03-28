import 'package:flutter/material.dart';
import 'package:my_app/consttants.dart';

class ReadingProgress extends StatelessWidget {
  final double progress;
  final double width;

  const ReadingProgress({
    Key? key,
    required this.progress,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Stack(
        children: [
          Container(
            width: width * progress,
            decoration: BoxDecoration(
              color: kProgressIndicator,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ],
      ),
    );
  }
} 