import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/color.dart';
import 'package:instagram/model/buttomNavigation.dart';

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return Container();
  }

 Widget getBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: bgLightGrey,
        border: Border(top: BorderSide(width: 1, color: bgDark.withOpacity(0.3))),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(icons.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  indexPage = index;
                });
              },
              icon: SvgPicture.asset(
                indexPage == index 
                ? icons[index]['active']
                : icons[index]['inactive'], 
                width: 25, 
                height: 25,
              ),
            );
          })
        ),
      ),
    );
  }
}
