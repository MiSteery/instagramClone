import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/color.dart';
import 'package:instagram/model/newFeed.dart';
import 'package:instagram/model/story.dart';

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
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            top: 5,
            left: 5,
            right: 5,
          ),
          child: Row(
              children: List.generate(stories.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                width: 80,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        stories[index]['isStory']
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient:
                                        LinearGradient(colors: bgStoryColors)),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 2, color: bgWhite),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              stories[index]['imageUrl']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1, color: bgGrey),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            stories[index]['imageUrl']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                        stories[index]['isAdd']
                            ? Positioned(
                                right: 5,
                                bottom: 0,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle, color: primary),
                                  child: Center(
                                      child: Icon(
                                    Icons.add,
                                    color: bgWhite,
                                    size: 20,
                                  )),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      stories[index]['username'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
            );
          })),
        ),
        Divider(),
        Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: bgStoryColors),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(1.3),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 2, color: bgWhite),
                                  image: DecorationImage(
                                    image: NetworkImage(newFeeds[0]['profile']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            newFeeds[0]['username'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        FontAwesome.ellipsis_v,
                        size: 15,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(newFeeds[0]['imageUrl']),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            splashRadius: 15,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/heart.svg',
                              width: 25,
                              height: 25,
                            ),
                          ),
                          IconButton(
                              splashRadius: 15,
                              onPressed: () {},
                              icon: Icon(
                                FontAwesome.comment_o,
                                size: 25,
                              )),
                          IconButton(
                            splashRadius: 15,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/images/share.svg',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Feather.bookmark))
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('${newFeeds[0] ['likes']}  likes', style: TextStyle(fontWeight: FontWeight.bold),)
                    
                  ],
                ),)
              ],
            )
          ],
        )
      ],
    );
  }
}
