import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:praktikum_16/bloc/delete_contact/delete_contact_bloc.dart';
import 'package:praktikum_16/bloc/delete_contact/delete_contact_event.dart';
import 'package:praktikum_16/bloc/delete_contact/delete_contact_state.dart';

import '../bloc/add_contact/contact_bloc.dart';
import '../bloc/add_contact/contact_state.dart';
import '../components/rounded_fill_button.dart';
import '../components/contact_card.dart';
import '../components/outline_black_icon_button.dart';
import '../models/users.dart';
import '../components/outline_icon_button.dart';
import '../themes/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? whatHappened;
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
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (BuildContext ctx, state) {
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
                child: ListView.builder(
                  itemCount: state.contact!.length,
                  itemBuilder: (ctx, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        List<User> list = state.contact!;
                        BlocProvider.of<DeleteContactBloc>(context)
                            .add(DeleteContacts(list[index]));
                      },
                      child: GestureDetector(
                        onTap: () =>
                            DetailContact(context, state.contact![index]),
                        child: ContactCard(
                          imageURL: state.contact![index].avatar,
                          name: state.contact![index].name,
                          phone: state.contact![index].phone,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
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
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: transparentColor,
    builder: (context) {
      // ignore: prefer_typing_uninitialized_variables
      var checkIsi;
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
                      image: NetworkImage(user.avatar),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  user.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: headingTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  user.phone,
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
                            user.gender!,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: medium,
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
                  height: 10.0,
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
                            user.status!,
                            style: subtitleTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: medium,
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
                  height: 10.0,
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
                                    fontWeight: medium,
                                  ),
                                )
                              : Text(
                                  user.hobi!,
                                  style: subtitleTextStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: medium,
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
