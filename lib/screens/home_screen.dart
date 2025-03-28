import 'package:flutter/material.dart';
import 'package:my_app/consttants.dart';
import 'package:my_app/screens/details_screen.dart';
import 'package:my_app/widgets/book_rating.dart';
import 'package:my_app/widgets/reading_card_list.dart';
import 'package:my_app/widgets/two_side_rounded_button.dart';
import 'package:my_app/widgets/reading_progress.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: _boxDeco(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height*.1,),
                  _topTitle(context),
                  SizedBox(height: 30,),
                  _horiBookScroll(context),
                  _bestWidget(context, size)
                ],
              ),
            )
          ],
        ),
      ),
    
    );
  }




























  Padding _bestWidget(BuildContext context, Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(text: "Best of the "),
                TextSpan(
                  text: "day",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          bestOfTheDayCard(size, context),
          RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(text: "Continue "),
                TextSpan(
                  text: "reading...",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(38.5),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 33,
                  color: Color(0xFFD3D3D3).withOpacity(.84),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(38.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Crushing & Influence",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Gary Venchuk",
                                  style: TextStyle(
                                    color: kLightBlackColor,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Text(
                                    "Chapter 7 of 10",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: kLightBlackColor,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                          Image.asset(
                            "assets/images/book-1.png",
                            width: 55,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                    width: size.width * .65,
                    child: ReadingProgress(
                      progress: 0.7, // 70% progress (7 of 10 chapters)
                      width: size.width * .65,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  SingleChildScrollView _horiBookScroll(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ReadingListCard(
            image: "assets/images/book-1.png",
            title: "Crushing & Influence",
            auth: "Gary Venchuk",
            rating: 4.9,
            pressDetails: () {
              Navigator.pushNamed(context, DetailsScreen.id);
            },
            pressRead: () {},
          ),
          ReadingListCard(
            image: "assets/images/book-2.png",
            title: "Top Ten Business Hacks",
            auth: "Herman Joel",
            rating: 4.8,
            pressDetails: () {},
            pressRead: () {},
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }

  Padding _topTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.headlineSmall,
          children: [
            TextSpan(text: "What are you \nreading "),
            TextSpan(
                text: "Sabir Bugti?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDeco() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/main_page_bg.png"),
        alignment: Alignment.topCenter,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Container bestOfTheDayCard(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 255,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 24,
                top: 24,
                right: size.width * .35,
              ),
              height: 245,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA).withOpacity(.45),
                borderRadius: BorderRadius.circular(29),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "New York Time Best For 11th March 2020",
                      style: TextStyle(
                        fontSize: 9,
                        color: kLightBlackColor,
                      ),
                    ),
                  ),
                  Text(
                    "How To Win \nFriends &  Influence",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Gary Venchuk",
                    style: TextStyle(color: kLightBlackColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: BookRating(
                            score: 4.9,
                            key: UniqueKey(),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "When the earth was flat and everyone wanted to win the game of the best and people….",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 10,
                              color: kLightBlackColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              "assets/images/book-3.png",
              width: size.width * .37,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              height: 40,
              width: size.width * .3,
              child: TwoSideRoundedButton(
                key: UniqueKey(),
                text: "Read",
                radious: 24,
                press: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
