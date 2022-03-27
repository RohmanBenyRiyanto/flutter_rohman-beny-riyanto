import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/input_text.dart';
import '../components/outline_icon_button.dart';
import '../components/primary_button.dart';
import '../models/users.dart';
import '../themes/theme.dart';

class AddContact extends StatefulWidget {
  final Function(User) addUser;

  const AddContact({
    Key? key,
    required this.addUser,
  }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _avatarController = TextEditingController();

    @override
    void dispose() {
      _nameController.dispose();
      _phoneController.dispose();
      _avatarController.dispose();
      super.dispose();
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
              )
            ],
          ),
        ),
      );
    }

    Widget _content() {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              InputText(
                controller: _avatarController,
                hintText: 'Enter your photos (link). . .',
                label: 'Photo Profile',
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: defaultMarginSpace,
              ),
              PrimaryButton(
                text: 'Submit',
                press: () {
                  final user = User(
                    name: _nameController.text.toString(),
                    avatar: _avatarController.text.toString(),
                    phone: _phoneController.text.toString().toString(),
                  );
                  widget.addUser(user);
                  _showToast();
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

    return Scaffold(
      appBar: _header(context),
      body: _content(),
    );
  }

  FToast? fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: greenColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text('Kontak berhasil ditambahkan'),
        ],
      ),
    );

    fToast!.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
