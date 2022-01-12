import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/color.dart';
import 'package:instagram/model/chat.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  int selectedIndex = 0;
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
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: textBlack,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                'Chats',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              IconButton(
                splashRadius: 15,
                onPressed: () {},
                icon: Icon(Feather.video),
              ),
              SizedBox(
                width: 5,
              ),
              IconButton(
                splashRadius: 15,
                onPressed: () {},
                icon: Icon(Feather.edit),
              ),
            ],
          )
        ],
      )),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  height: 45,
                  width: size.width * 0.5,
                  child: InkWell(
                    child: Center(
                      child: Text(
                        'Chats',
                        style: TextStyle(
                            color: selectedIndex == 0
                                ? textBlack
                                : textBlack.withOpacity(0.5)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                ),
                Container(
                  height: 45,
                  width: size.width * 0.5,
                  child: InkWell(
                    child: Center(
                      child: Text(
                        'Rooms',
                        style: TextStyle(
                            color: selectedIndex == 1
                                ? textBlack
                                : textBlack.withOpacity(0.5)),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              width: size.width,
              decoration: BoxDecoration(color: bgGrey),
            )
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [getChats(size), Text('room')],
        )
      ],
    );
  }

  Widget getChats(size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 15,
            left: 10,
            right: 10,
          ),
          child: Container(
            height: 41,
            width: (size.width - 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: bgGrey.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: TextField(
                cursorColor: textBlack.withOpacity(0.5),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: textBlack.withOpacity(0.5),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: textBlack.withOpacity(0.5))),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    height: (size.width - 20) * 0.15,
                    width: (size.width - 20) * 0.15,
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    chats[0]['profile'],
                                  ),
                                  fit: BoxFit.cover,
                                ))),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
