import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram/constant.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Feather.lock,
                  size: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  username,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    splashRadius: 15,
                    onPressed: () {},
                    icon: Icon(AntDesign.plus),
                    ),
                        IconButton(
                    splashRadius: 15,
                    onPressed: () {},
                    icon: Icon(FontAwesome.bars),
                    )
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget getBody() {
    return Container();
  }
}
