import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      body: getBody(size),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
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
                    image: NetworkImage(chats[0]['profile']),
                    fit: BoxFit.cover),
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
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Feather.video),
              onPressed: () {},
            ),
            SizedBox(
              width: 5,
            ),
            IconButton(
              icon: Icon(Feather.info),
              onPressed: () {},
            )
          ],
        )
      ])),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Container(
          height: size.height * 0.83,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ChatBubble(),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: bgGrey.withOpacity(0.3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Hi',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
