import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 90,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(FontAwesome5Brands.facebook_messenger))
          ],
        ),
      )),
      preferredSize: Size.fromHeight(70),
    );
  }

  Widget getBody() {
    return Container();
  }
}
