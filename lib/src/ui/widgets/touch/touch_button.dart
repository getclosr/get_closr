import 'package:flutter/material.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart';
import 'package:overlay_support/overlay_support.dart';

class TouchButton extends StatelessWidget {
  const TouchButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(
            Icons.add_alarm,
            color: kClosrBrown900,
          ),
          onPressed: () {
            showSimpleNotification(Text('One touch is sent!'),
                background: kClosrPink400,
                autoDismiss: true, trailing: Builder(builder: (context) {
              return FlatButton(
                textColor: kClosrSurfaceWhite,
                onPressed: () {
                  OverlaySupportEntry.of(context).dismiss();
                },
                child: Text('Dismiss'),
              );
            }));
          },
          heroTag: 'Touch 1',
          backgroundColor: kClosrBackgroundWhite,
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
    );
  }
}
