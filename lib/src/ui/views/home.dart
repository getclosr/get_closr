import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart';
import 'package:get_closr/src/ui/shared/screensize_reducers.dart';
import 'package:get_closr/src/ui/shared/ui_helper.dart';
import 'package:get_closr/src/ui/widgets/chat/chat_bottom_sheet.dart';
import 'package:get_closr/src/ui/widgets/touch/touch_button.dart';
import 'package:get_closr/src/ui/widgets/touch/touch_rating.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

// import 'package:get_closr/src/core/app_constants.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Alignment childAlignment = Alignment.center;

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
      drawer: _drawer(),
      body: AnimatedContainer(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 400),
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: childAlignment,
        child: ListView(
          children: <Widget>[
            Text(
              'Welcome! User',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            // CarouselSlider(
            //   height: MediaQuery.of(context).size.height / 10 * 4,
            //   viewportFraction: 0.9,
            //   aspectRatio: 2.0,
            //   autoPlay: true,
            //   enlargeCenterPage: true,
            //   items: imgList.map(
            //     (url) {
            //       return Container(
            //         margin: EdgeInsets.all(5.0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //           child: Image.network(
            //             url,
            //             fit: BoxFit.cover,
            //             width: 1000.0,
            //           ),
            //         ),
            //       );
            //     },
            //   ).toList(),
            // ),
            Text(
              'Your Closr People',
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
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircularProfileAvatar(
                      'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                      radius: 40,
                      backgroundColor: Colors.green,
                      borderWidth: 2,
                      initialsText: Text(
                        "AD",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      borderColor: Colors.brown,
                      elevation: 5.0,
                      onTap: () {
                        print('adil');
                      },
                    ),
                    CircularProfileAvatar(
                      'https://avatars0.githubusercontent.com/u/8264639?s=460&v=4',
                      radius: 40,
                      backgroundColor: Colors.green,
                      borderWidth: 5,
                      initialsText: Text(
                        "AD",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      borderColor: Colors.yellow,
                      elevation: 5.0,
                      foregroundColor: Colors.yellow.withOpacity(0.5),
                      onTap: () {
                        print('adil');
                      },
                      showInitialTextAbovePicture: true,
                    ),
                    CircularProfileAvatar(
                      '',
                      radius: 40,
                      backgroundColor: Colors.green,
                      initialsText: Text(
                        "AD",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      elevation: 5.0,
                    ),
                    CircularProfileAvatar(
                      '',
                      radius: 40,
                      backgroundColor: Colors.green,
                      initialsText: Text(
                        "AD",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      elevation: 5.0,
                    ),

                  ],
                ),
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Text(
              'Send a touch now',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Container(
              height: screenHeight(context, dividedBy:10),
              decoration: BoxDecoration(
                color: kClosrPink100,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TouchButton(),
            ),

            UIHelper.verticalSpaceMedium(),
            Text(
              'Rate your last touch',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            UIHelper.verticalSpaceSmall(),
            Container(
              height: screenHeight(context, dividedBy: 15),
              decoration: BoxDecoration(
                color: kClosrPink100,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TouchRating(),
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

  Widget _drawer() {
    return Drawer(
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
    );
  }
}
