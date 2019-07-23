import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:get_closr/src/ui/views/home.dart';


class TestView extends StatelessWidget {
  const TestView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text("Backdrop test"),
      backLayer: HomeView(),
       frontLayer: Center(
          child: Text("Front Layer"),
        ),
        iconPosition: BackdropIconPosition.leading,
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          ),
        ],
        headerHeight: 100,
        frontLayerBorderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    );
  }
}
