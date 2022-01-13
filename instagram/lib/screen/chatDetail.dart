
import 'package:flutter/material.dart';
import 'package:instagram/color.dart';

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

  Widget getAppBar(){
    return PreferredSize(
       preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child:Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: textBlack,),
                onPressed: () {
                    Navigator.pop(context);
                  },
            
            )
          ],
        )
        ),
      );
  }
}