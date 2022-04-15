import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:praktikum/providers/contact_provider.dart';

import 'package:provider/provider.dart';

import '../components/input_text.dart';
import '../components/outline_icon_button.dart';
import '../components/primary_button.dart';

import '../models/contact_model.dart';
import '../themes/theme.dart';

class AddContact extends StatefulWidget {
  const AddContact({
    Key? key,
  }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  AppBar _header() {
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
              icons: 'assets/icons/left_ios_arrow.svg',
              press: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Add Contact',
              style: headingTextStyle.copyWith(
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
      ),
    );
  }

  Widget _content(context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tambahkan Kontak Anda\nDengan Mudah!',
              style: headingTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: bold,
              ),
            ),
            Text(
              'Semakin banyak teman yang Anda punya, semakin banyak ayang yang Anda dapatkan!.',
              style: subtitleTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: defaultMarginSpace * 1,
            ),
            InputText(
              controller: _nameController,
              hintText: 'Enter user name. . .',
              label: 'Username',
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: defaultMarginSpace,
            ),
            InputText(
              controller: _phoneController,
              hintText: 'Enter user number. . .',
              label: 'Phone Number',
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: defaultMarginSpace,
            ),
            PrimaryButton(
              text: 'Add Contact',
              press: () {
                if (_nameController.text.isEmpty &&
                    _phoneController.text.isEmpty) {
                  _showErrorToast();
                } else {
                  final ContactModel contact = ContactModel(
                    name: _nameController.text,
                    phone: _phoneController.text,
                  );
                  contactProvider.createContact(contact);
                  _showToastSucces();
                  Navigator.pop(context);
                }
              },
            ),
            SizedBox(
              height: defaultMarginSpace,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _header(),
      body: _content(context),
    );
  }

  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  _showErrorToast() {
    fToast!.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: redColor,
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: Text(
          'Please fill all the fields!',
          style: whiteTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: medium,
          ),
        ),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  _showToastSucces() {
    fToast!.showToast(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(60.0),
            ),
            child: Text(
              'Kontak Berhasil Di Tambahkan!',
              style: whiteTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
