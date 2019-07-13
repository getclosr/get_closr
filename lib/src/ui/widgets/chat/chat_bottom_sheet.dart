import 'package:flutter/material.dart';
import 'package:get_closr/src/ui/shared/app_colors.dart';
import 'package:get_closr/src/utils/bottom_sheet_fix.dart';

class ChatTrigger extends StatefulWidget {
  ChatTrigger({Key key}) : super(key: key);

  _ChatTriggerState createState() => _ChatTriggerState();
}

class _ChatTriggerState extends State<ChatTrigger> {
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showModalBottomSheet(context);
      },
      heroTag: "Chat",
      elevation: 5,
      backgroundColor: kClosrPink100,
      child: Icon(
        Icons.chat_bubble_outline,
        color: kClosrBrown900,
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheetApp(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height - 200,
            //TODO: adjust to height of keyboard if keyboard is open
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),

          );
        });
  }
}
