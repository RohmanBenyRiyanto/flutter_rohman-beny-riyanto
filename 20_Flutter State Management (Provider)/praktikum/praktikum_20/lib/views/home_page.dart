import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:praktikum_16/components/rounded_fill_button.dart';
import 'package:praktikum_16/providers/contact_providers.dart';
import 'package:provider/provider.dart';

import '../components/contact_card.dart';
import '../components/outline_black_icon_button.dart';
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

  bool checkIsi = true;

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  AppBar _header(BuildContext context) {
    final contactProvider = Provider.of<Contact>(context);
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
                Navigator.pushNamed(context, '/add-contact');
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
                onChanged: contactProvider.searchMethod,
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
    final contactProvider = Provider.of<Contact>(context);
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
            child: _searchController!.text.isNotEmpty &&
                    contactProvider.searchMethod != null
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
                        ? contactProvider.usersOnSearch.length
                        : contactProvider.users.length,
                    itemBuilder: (context, index) {
                      final user = contactProvider.users[index];
                      return Dismissible(
                        key: Key(user.name),
                        onDismissed: (direction) {
                          setState(() {
                            users.removeAt(index);
                          });

                          // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: redColor,
                              shape: const RoundedRectangleBorder(
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
                              ),
                            ),
                          );
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
                              break;
                            case DismissDirection.up:
                              break;
                            case DismissDirection.down:
                              break;
                            case DismissDirection.none:
                              break;
                          }
                          return false;
                        },
                        child: GestureDetector(
                          onTap: (() {
                            DetailContact(context, user);
                          }),
                          child: ContactCard(
                            imageURL: _searchController!.text.isNotEmpty
                                ? contactProvider.usersOnSearch[index].avatar
                                : user.avatar,
                            name: _searchController!.text.isNotEmpty
                                ? user.name
                                : contactProvider.users[index].name,
                            phone: _searchController!.text.isNotEmpty
                                ? contactProvider.usersOnSearch[index].phone
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

Future<dynamic> DetailContact(BuildContext context, User user) {
  final contactProvider = Provider.of<Contact>(context);
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: transparentColor,
    builder: (context) {
      var checkIsi;
      var index;
      return Wrap(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: defaultMarginBody,
              right: defaultMarginBody,
              bottom: defaultMarginBody,
            ),
            padding: const EdgeInsets.all(10.0),
            // height: displayHeight(context) * 0.6,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineIconsButton(
                      icons: 'assets/icons/left_ios_arrow.svg',
                      press: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Detail Contact',
                      style: headingTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: bold,
                      ),
                    ),
                    Container(
                      height: 35.0,
                      padding: const EdgeInsets.all(1.5),
                      child: IconButton(
                        splashColor: transparentColor,
                        highlightColor: transparentColor,
                        icon: SvgPicture.asset(
                          'assets/icons/add.svg',
                          color: transparentColor,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 90.0,
                  width: 90.0,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        contactProvider.users[index].avatar,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  contactProvider.users[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: headingTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  contactProvider.users[index].phone,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: subtitleTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RoundedFillButton(
                      icons: 'assets/icons/phone.svg',
                      press: () {},
                    ),
                    OutlineBlackIconsButton(
                      icons: 'assets/icons/video.svg',
                      press: () {},
                    ),
                    OutlineBlackIconsButton(
                      icons: 'assets/icons/message.svg',
                      press: () {},
                    ),
                    OutlineBlackIconsButton(
                      icons: 'assets/icons/email.svg',
                      press: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gender :',
                            style: headingTextStyle.copyWith(
                              fontSize: 15.0,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            contactProvider.users[index].gender!,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status :',
                            style: headingTextStyle.copyWith(
                              fontSize: 15.0,
                              fontWeight: semiBold,
                            ),
                          ),
                          Text(
                            contactProvider.users[index].status!,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hobby :',
                            style: headingTextStyle.copyWith(
                              fontSize: 15.0,
                              fontWeight: semiBold,
                            ),
                          ),
                          checkIsi == user.hobi?.isEmpty
                              ? Text(
                                  'Hobi Belum Di Isi',
                                  style: subtitleTextStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: semiBold,
                                  ),
                                )
                              : Text(
                                  contactProvider.users[index].hobi!,
                                  style: subtitleTextStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: semiBold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
