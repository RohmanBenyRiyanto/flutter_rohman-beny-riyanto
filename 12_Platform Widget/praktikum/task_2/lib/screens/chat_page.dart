import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

import '../component/chat_card.dart';
import '../model/chat_model.dart';

const Color _primaryColor = Color(0xFF007AFF);
const Color _whiteColor = Color(0xFFFFFFFF);
const Color _greyColor = Color(0xFFC5C5C7);
const Color _grey2Color = Color(0xFF8E8E93);
double _defaultPadding = 16.0;

final List<Chat> chatUsers = [
  Chat(
    imageURL: 'LM',
    messageText: 'Ayang dimana ya? 😭',
    name: 'Lalisa Manoban',
    time: '11:00 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    badge: 1,
  ),
  Chat(
    imageURL: 'J',
    messageText: 'Lemes bestie ayang ilang 😥',
    name: 'Jennie',
    time: '10:55 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    badge: 3,
  ),
  Chat(
    imageURL: 'J',
    messageText: 'Ayang nanti malam jalan ya?',
    name: 'Jisoo',
    time: '10:50 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    badge: 2,
  ),
  Chat(
    imageURL: 'R',
    messageText: 'Aku mau makan nasi goreng',
    name: 'Rose',
    time: '10:50 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
    badge: 2,
  ),
  Chat(
    imageURL: 'I',
    messageText: '안녕! 그리워 😓',
    name: 'Irene',
    time: '10:50 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
  Chat(
    imageURL: 'PSY',
    messageText: 'Hello, bestiii!',
    name: 'Park Soo-young',
    time: '10:40 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
  Chat(
    imageURL: 'YS',
    messageText: '은 단순히 인쇄 및 조판 산업의 더미 텍스트입니다.',
    name: 'Yoona SND',
    time: '10:40 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
  Chat(
    imageURL: 'KYM',
    messageText: '레이아웃을 볼 때 페이지의 읽을 수 있는 콘텐츠.',
    name: 'Kim Ye-rim',
    time: '10:40 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
  Chat(
    imageURL: 'KSG',
    messageText: '은 단순히 인쇄 및 조판.',
    name: 'Kang Seul-gi',
    time: '09:30 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
  Chat(
    imageURL: 'Lh',
    messageText: '은 단순히?',
    name: 'Lee Hi',
    time: '08:16 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
  Chat(
    imageURL: 'BS',
    messageText: '수지라는 예명으로 더 잘 알려진 배수지는 가수다.',
    name: 'Bae Suzy',
    time: '07:20 PM',
    color:
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
  ),
];

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    CupertinoNavigationBar header() {
      return CupertinoNavigationBar(
        backgroundColor: _whiteColor,
        middle: const Text(
          'Chats',
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: GestureDetector(
            child: const Text(
              'Edit',
              style: TextStyle(
                color: _primaryColor,
              ),
            ),
            onTap: () {
              // ignore: avoid_print
              print('Klik Edit');
            },
          ),
        ),
        trailing: GestureDetector(
          child: SvgPicture.asset('assets/edit_icon.svg'),
          onTap: () {
            // ignore: avoid_print
            print('Klik Create');
          },
        ),
      );
    }

    Widget searchBar() {
      return CupertinoSearchTextField(
        placeholder: '',
        prefixIcon: Padding(
          padding: EdgeInsets.only(
            top: 4.0,
            left: MediaQuery.of(context).size.width / 3,
          ),
          child: Row(
            children: const [
              Icon(
                CupertinoIcons.search,
                color: _grey2Color,
              ),
              SizedBox(
                width: 5.0,
              ),
              Text(
                'Search',
                style: TextStyle(
                  color: _grey2Color,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // ignore: avoid_print
          print('Klik Search');
        },
      );
    }

    Widget sectionBar() {
      return Padding(
        padding: EdgeInsets.only(top: _defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: const [
                    Text(
                      'All Chats',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _grey2Color,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Work',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _grey2Color,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      width: 18.0,
                      height: 18.0,
                      decoration: const BoxDecoration(
                        color: _primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '1',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: _whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Unread',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _primaryColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      width: 18.0,
                      height: 18.0,
                      decoration: const BoxDecoration(
                        color: _primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '9',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: _whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const SizedBox(
                  width: 60.0,
                  child: Divider(
                    height: 1.0,
                    thickness: 2.0,
                    color: _primaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Personal',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: _grey2Color,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      width: 18.0,
                      height: 18.0,
                      decoration: const BoxDecoration(
                        color: _primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: _whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content(context) {
      return Flexible(
        flex: 1,
        child: ListView.builder(
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
        ),
      );
    }

    return CupertinoPageScaffold(
      navigationBar: header(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(_defaultPadding),
          child: Column(
            children: [
              searchBar(),
              sectionBar(),
              content(context),
            ],
          ),
        ),
      ),
    );
  }
}
