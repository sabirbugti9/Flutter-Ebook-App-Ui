import 'package:flutter/material.dart';
import 'package:my_app/consttants.dart';
import 'package:my_app/widgets/two_side_rounded_button.dart';

class ReadingListCard extends StatefulWidget {
  final String image;
  final String title;
  final String auth;
  final double rating;
  final Function pressDetails;
  final Function pressRead;

  const ReadingListCard({
    Key? key,
    required this.image,
    required this.title,
    required this.auth,
    required this.rating,
    required this.pressDetails,
    required this.pressRead,
  }) : super(key: key);

  @override
  State<ReadingListCard> createState() => _ReadingListCardState();
}

class _ReadingListCardState extends State<ReadingListCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: EdgeInsets.only(left: 24, bottom: 40),
          height: 245,
          width: 202,
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 221,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 33,
                        color: kShadowColor,
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                widget.image,
                width: 150,
              ),
              Positioned(
                top: 35,
                right: 10,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                    ),
                    Container(
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
                          Icon(
                            Icons.star,
                            color: kIconColor,
                            size: 15,
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.rating.toString(),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 160,
                child: Container(
                  height: 85,
                  width: 202,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            style: TextStyle(color: kBlackColor),
                            children: [
                              TextSpan(
                                text: "${widget.title}\n",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: widget.auth,
                                style: TextStyle(
                                  color: kLightBlackColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => widget.pressDetails(),
                            child: Container(
                              width: 101,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              child: Text("Details"),
                            ),
                          ),
                          Expanded(
                            child: TwoSideRoundedButton(
                              key: UniqueKey(),
                              text: "Read",
                              press: widget.pressRead,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
