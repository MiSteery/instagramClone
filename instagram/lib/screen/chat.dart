import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
     bottomSheet: getBottomSheet(),
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
          children: [
            getChats(size),
            getRooms(size),
         
          ],
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
            children: List.generate(chats.length, (index) {
          return InkWell(
            onTap: () {},
            child: Padding(
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
                                chats[index]['profile'],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 18,
                            width: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: bgWhite),
                              color: success,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.7,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chats[index]['username'],
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '${chats[index]['description']} * ${chats[0]['dateTime']}',
                            style: TextStyle(
                                fontSize: 16, height: 1, color: textGrey),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.15,
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Feather.camera,
                      color: textBlack.withOpacity(0.5),
                    ),
                  )
                ],
              ),
            ),
          );
        }))
      ],
    );
  }

  Widget getRooms(size) {
    return Center(
        child: Padding(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(children: [
        SvgPicture.asset(
          'assets/images/video.svg',
          width: 100,
        ),
        Text(
          'Video Chat With Anyone',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Text(
          'Invite up to 50 people to join a video chat, even if they dont have Instagram or Messenger',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, height: 1.5, color: textBlack.withOpacity(0.8)),
        ),
        SizedBox(height: 20,),
        Container(
          height: 50,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: primary,
          ),
          child: Center(
            child: Text('Create Room ', style: TextStyle(color: textWhite),),
          ),
        )
      ]),
    ));
  }

Widget getBottomSheet(){
  return Container(
    height:60,
    decoration: BoxDecoration(
      color: bgLightGrey,
      border: Border(
        top: BorderSide(width: 1, color: bgGrey.withOpacity(0.3)),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesome.camera, color:primary,),
        SizedBox(width: 10,),
        Text('Camera', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primary),)
      ],
    ),
  );
}
}
