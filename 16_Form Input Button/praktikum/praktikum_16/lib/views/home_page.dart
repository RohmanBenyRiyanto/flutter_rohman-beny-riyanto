import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transition/transition.dart';

import '../components/chat_card.dart';
import '../models/users.dart';
import '../components/outline_icon_button.dart';
import '../themes/theme.dart';
import 'add_contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController? _searchController = TextEditingController();
  String? whatHappened;

  List<User> users = UserList;
  List<User> usersOnSearch = [];

  bool lastPadding = false;

  void _addUsersData(User user) {
    setState(() {
      UserList.insert(0, user);
      // UserList.add(user);
    });
  }

  @override
  void dispose() {
    usersOnSearch.clear();
    _searchController?.dispose();
    setState(() {
      _searchController!.text = '';
    });
    super.dispose();
  }

  void searchMethod(value) {
    setState(() {
      usersOnSearch = UserList.where(
              (user) => user.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  AppBar _header(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMarginAppBar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineIconsButton(
              icons: 'assets/icons/dashboard.svg',
              press: () {
                print('dashboard');
              },
            ),
            Text(
              'Contact',
              style: headingTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            OutlineIconsButton(
              icons: 'assets/icons/add.svg',
              press: () {
                Navigator.push(
                  context,
                  Transition(
                    child: AddContact(
                      addUser: _addUsersData,
                    ),
                    transitionEffect: TransitionEffect.FADE,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(displayHeight(context) * 0.07),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                color: silverColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: searchMethod,
                style: titleTextStyle.copyWith(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  isDense: true,
                  hintText: 'Search...',
                  hintStyle: titleTextStyle.copyWith(
                    color: greyColor,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            primaryColor,
                            secondaryColor,
                          ],
                        ),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMarginBody,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: defaultMarginSpace,
            ),
            child: Text(
              'My Contact',
              style: headingTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ),
          Expanded(
            child: _searchController!.text.isNotEmpty && usersOnSearch.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/box.png',
                          height: 90.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Kontak Tidak\nDitemukan!',
                          style: headingTextStyle.copyWith(
                            fontSize: 20.0,
                            fontWeight: bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _searchController!.text.isNotEmpty
                        ? usersOnSearch.length
                        : users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return Dismissible(
                        key: Key(user.name),
                        onDismissed: (direction) {
                          setState(() {
                            users.removeAt(index);
                          });

                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: redColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              content: Text(
                                "${user.name} berhasil di $whatHappened",
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                                textAlign: TextAlign.center,
                              )));
                        },
                        direction: DismissDirection.endToStart,
                        background: Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 4,
                                child: Container(),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  width: displayWidth(context),
                                  decoration: BoxDecoration(
                                      color: redColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        confirmDismiss:
                            (DismissDirection dismissDirection) async {
                          switch (dismissDirection) {
                            case DismissDirection.endToStart:
                              whatHappened = 'Hapus!';
                              return await _showConfirmationDialog(
                                      context, 'Hapus') ==
                                  true;
                            case DismissDirection.startToEnd:
                              whatHappened = 'DELETED';
                              return await _showConfirmationDialog(
                                      context, 'Delete') ==
                                  true;
                            case DismissDirection.horizontal:
                            case DismissDirection.vertical:
                            case DismissDirection.up:
                            case DismissDirection.down:
                              assert(false);
                              break;
                            case DismissDirection.none:
                              // TODO: Handle this case.
                              break;
                          }
                          return false;
                        },
                        child: GestureDetector(
                          child: ContactCard(
                            imageURL: _searchController!.text.isNotEmpty
                                ? usersOnSearch[index].avatar
                                : user.avatar,
                            name: _searchController!.text.isNotEmpty
                                ? usersOnSearch[index].name
                                : user.name,
                            phone: _searchController!.text.isNotEmpty
                                ? usersOnSearch[index].phone
                                : user.phone,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: _content(context),
    );
  }
}

Future<bool?> _showConfirmationDialog(BuildContext context, String action) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: silverColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Text(
          'Sudah yakin mau $action kontak ini?',
          style: headingTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: bold,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Ya',
              style: primaryTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: semiBold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, true); // showDialog() returns true
            },
          ),
          TextButton(
            child: Text(
              'Batal',
              style: primaryTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: semiBold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, false); // showDialog() returns false
            },
          ),
        ],
      );
    },
  );
}
