import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_closr/src/core/app_constants.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart' as prefix0;
import 'package:get_closr/src/ui/shared/ui_helper.dart';
import 'package:get_closr/src/ui/widgets/chat/chat_bottom_sheet.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:like_button/like_button.dart';
import 'package:overlay_support/overlay_support.dart';

const double buttonSize = 30.0;

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Alignment childAlignment = Alignment.center;
  final int likeCount = 999;

  @override
  void initState() {
    KeyboardVisibilityNotification().addNewListener(onChange: (bool visible) {
      setState(() {
        childAlignment = visible ? Alignment.topCenter : Alignment.center;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        title: Text("Home"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Get Closr'),
            ),
            ListTile(title: Text('Account'), onTap: () {}),
            ListTile(title: Text('Settings'), onTap: () {}),
            ListTile(title: Text('Terms of Use'), onTap: () {}),
            ListTile(title: Text('Sign Out'), onTap: () {}),
          ],
        ),
      ),
      body: AnimatedContainer(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 400),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: childAlignment,
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: 40,
              child: Text(
                'Welcome!',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            CarouselSlider(
              height: MediaQuery.of(context).size.height / 10 * 4,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              autoPlay: true,
              enlargeCenterPage: true,
              items: imgList.map(
                (url) {
                  return Container(
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: 1000.0,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            Text(
              'Send a touch now',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                color: kClosrPink100,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: Icon(
                      Icons.add_alarm,
                      color: kClosrBrown900,
                    ),
                    onPressed: () {
                      showSimpleNotification(Text('One touch is sent!'),
                          background: Colors.purple, autoDismiss: false,
                          trailing: Builder(builder: (context) {
                        return FlatButton(
                          textColor: Colors.yellow,
                          onPressed: () {
                            OverlaySupportEntry.of(context).dismiss();
                          },
                          child: Text('Dismiss'),
                        );
                      }));
                    },
                    heroTag: 'Touch 1',
                    backgroundColor: prefix0.kClosrBackgroundWhite,
                    elevation: 3,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'Touch 2',
                    backgroundColor: kClosrGrey,
                    elevation: 3,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: 'Touch 3',
                    backgroundColor: kClosrGrey,
                    elevation: 3,
                  )
                ],
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Text(
              'Rate your last touch',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Container(
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                color: kClosrPink100,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  LikeButton(
                    size: buttonSize,
                    circleColor: CircleColor(
                        start: Colors.pinkAccent[200],
                        end: Colors.pinkAccent[400]),
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
                    circleColor: CircleColor(
                        start: Color(0xff669900), end: Color(0xff669900)),
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
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
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
                      var color =
                          isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
              ),
            ),
            UIHelper.verticalSpaceMedium(),
            Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: ChatTrigger(),
            ),
            UIHelper.verticalSpaceMedium(),
          ],
        ),
      ),
    );
  }
}
