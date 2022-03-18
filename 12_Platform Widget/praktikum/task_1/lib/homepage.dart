import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'chat_card.dart';
import 'chat_model.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _primaryColor = const Color(0xFF59779c);
  final _secondaryColor = const Color(0xFF80ba62);
  final _whiteColor = const Color(0xFFFFFFFF);
  final _blackColor = const Color(0xFF000000);

  final List<Chat> chatUsers = [
    Chat(
      imageURL: 'LM',
      messageText: 'Ayang dimana ya? 😭',
      name: 'Lalisa Manoban',
      time: '11:00 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      badge: 1,
    ),
    Chat(
      imageURL: 'J',
      messageText: 'Lemes bestie ayang ilang 😥',
      name: 'Jennie',
      time: '10:55 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      badge: 3,
    ),
    Chat(
      imageURL: 'J',
      messageText: 'Ayang nanti malam jalan ya?',
      name: 'Jisoo',
      time: '10:50 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      badge: 2,
    ),
    Chat(
      imageURL: 'R',
      messageText: 'Aku mau makan nasi goreng',
      name: 'Rose',
      time: '10:50 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      badge: 2,
    ),
    Chat(
      imageURL: 'I',
      messageText: '안녕! 그리워 😓',
      name: 'Irene',
      time: '10:50 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
    Chat(
      imageURL: 'PSY',
      messageText: 'Hello, bestiii!',
      name: 'Park Soo-young',
      time: '10:40 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
    Chat(
      imageURL: 'YS',
      messageText: '은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다.',
      name: 'Yoona SND',
      time: '10:40 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
    Chat(
      imageURL: 'KYM',
      messageText: '레이아웃을 볼 때 페이지의 읽을 수 있는 콘텐츠.',
      name: 'Kim Ye-rim',
      time: '10:40 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
    Chat(
      imageURL: 'KSG',
      messageText: '은 단순히 인쇄 및 조판.',
      name: 'Kang Seul-gi',
      time: '09:30 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
    Chat(
      imageURL: 'Lh',
      messageText: '은 단순히?',
      name: 'Lee Hi',
      time: '08:16 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
    Chat(
      imageURL: 'BS',
      messageText: '수지라는 예명으로 더 잘 알려진 배수지는 가수다.',
      name: 'Bae Suzy',
      time: '07:20 PM',
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
    ),
  ];

  AppBar header() {
    return AppBar(
      backgroundColor: _primaryColor,
      elevation: 0,
      title: const Text('Telegram'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ],
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  _primaryColor,
                  _secondaryColor,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 55.0,
                  height: 55.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff1d3859),
                  ),
                  child: const Center(
                    child: Text(
                      'RB',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  'Rohman Beny',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Text(
                  '+61 (812)345 67',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.group,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'New Group',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.lock,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'New Secret Chat',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.volume_mute_rounded,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'New Channel',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Divider(
              height: 1.0,
              color: Color(0xffcccccc),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.contact_page_rounded,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'Contacts',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.group_add_sharp,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'Invite Friends',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'Settings',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.question_mark_rounded,
              color: Color.fromARGB(255, 124, 124, 124),
            ),
            title: Text(
              'Telegram FAQ',
              style: TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget floatButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.create),
      backgroundColor: _primaryColor,
    );
  }

  Widget content(context) {
    return ListView.builder(
      itemCount: chatUsers.length,
      itemBuilder: (context, index) {
        return ChatCard(
          imageURL: chatUsers[index].imageURL,
          messageText: chatUsers[index].messageText,
          name: chatUsers[index].name,
          time: chatUsers[index].time,
          color: chatUsers[index].color,
          badge: chatUsers[index].badge,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _whiteColor,
      appBar: header(),
      drawer: drawer(),
      floatingActionButton: floatButton(),
      body: content(context),
    );
  }
}
