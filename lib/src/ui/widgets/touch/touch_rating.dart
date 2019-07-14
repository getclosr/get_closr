import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

const double buttonSize = 30.0;

class TouchRating extends StatelessWidget {
  const TouchRating({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int likeCount = 999;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        LikeButton(
          size: buttonSize,
          circleColor: CircleColor(
              start: Colors.pinkAccent[200], end: Colors.pinkAccent[400]),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Colors.lightBlue[300],
            dotSecondaryColor: Colors.lightBlue[200],
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.insert_emoticon,
              color: isLiked ? Colors.lightBlueAccent : Colors.grey,
              size: buttonSize,
            );
          },
        ),
        LikeButton(
          size: buttonSize,
          likeCount: likeCount,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.pinkAccent : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                count >= 1000
                    ? (count / 1000.0).toStringAsFixed(1) + "k"
                    : text,
                style: TextStyle(color: color),
              );
            return result;
          },
          likeCountAnimationType: likeCount < 1000
              ? LikeCountAnimationType.part
              : LikeCountAnimationType.none,
          likeCountPadding: EdgeInsets.only(left: 15.0),
        ),
        LikeButton(
          size: buttonSize,
          isLiked: null,
          circleColor: CircleColor(
            start: Colors.redAccent[100],
            end: Colors.redAccent[400],
          ),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Colors.red[300],
            dotSecondaryColor: Colors.red[200],
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.assistant_photo,
              color: Colors.red,
              size: buttonSize,
            );
          },
          likeCount: 888,
          countBuilder: (int count, bool isLiked, String text) {
            var color = Colors.red;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
          likeCountPadding: EdgeInsets.only(left: 15.0),
        ),
        LikeButton(
          size: buttonSize,
          circleColor:
              CircleColor(start: Color(0xff669900), end: Color(0xff669900)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff669900),
            dotSecondaryColor: Color(0xff99cc00),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.adb,
              color: isLiked ? Colors.green : Colors.grey,
              size: buttonSize,
            );
          },
          likeCount: 665,
          likeCountAnimationType: LikeCountAnimationType.all,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.green : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
          likeCountPadding: EdgeInsets.only(left: 15.0),
        ),
        LikeButton(
          size: buttonSize,
          circleColor:
              CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Color(0xff33b5e5),
            dotSecondaryColor: Color(0xff0099cc),
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.home,
              color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
              size: buttonSize,
            );
          },
          likeCount: 665,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
          likeCountPadding: EdgeInsets.only(left: 15.0),
        ),
      ],
    );
  }
}
