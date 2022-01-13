import 'package:flutter/material.dart';
import 'package:instagram/color.dart';
import 'package:instagram/model/chat.dart';

class ChatDetail extends StatefulWidget {
  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
          child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: textBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10),
          Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(chats[0]['profile']), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            chats[0]['username'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}
