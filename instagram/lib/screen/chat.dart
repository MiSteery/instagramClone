import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/color.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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
                onPressed: (){}, icon: Icon(Feather.video),
                ),
                SizedBox(width: 5,),
                IconButton(
                splashRadius: 15,
                onPressed: (){}, icon: Icon(Feather.edit),
                ),
            ],
          )
        ],
      )),
    );
  }

Widget getBody(size){
  return ListView(
    children: [
      Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 45,
                width: size.width * 0.5,
                child: InkWell(
                  onTap: (){},
                  child: Center(
                    child: Text('Chats', style:TextStyle(color: textBlack),
                  ),
                ),
              ),
              ),
               Container(
                height: 45,
                width: size.width * 0.5,
                child: InkWell(
                  onTap: (){},
                  child: Center(
                    child: Text('Rooms', style:TextStyle(color: textBlack),
                  ),
                ),
              ),
              ),
            ],
          ),
         
        ],
      )
    ],
  );
}
}

