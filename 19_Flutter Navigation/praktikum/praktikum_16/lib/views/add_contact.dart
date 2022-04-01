import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:praktikum_16/models/checkbox_model.dart';

import '../components/input_text.dart';
import '../components/outline_icon_button.dart';
import '../components/primary_button.dart';
import '../models/users.dart';
import '../themes/theme.dart';

class AddContact extends StatefulWidget {
  static const String routeName = '/add-contact';

  // final Function(User) addUser;

  const AddContact({
    Key? key,
    // required this.addUser,
  }) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
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

  void _addUsersData(User user) {
    setState(() {
      UserList.insert(0, user);
      // UserList.add(user);
    });
  }

  List<String> _dropdownItems = ['Menikah', 'Belum Menikah'];
  List<int> list_items = [1, 2, 4, 5];
  var _value;
  String _selectedGender = 'Laki - Laki';

  List multipleSelected = [];
  List<CheckBoxModel> checkListItems = [
    CheckBoxModel(
      id: 1,
      title: 'Sing',
      isChecked: false,
    ),
    CheckBoxModel(
      id: 1,
      title: 'Dancing',
      isChecked: false,
    ),
    CheckBoxModel(
      id: 1,
      title: 'Nothing',
      isChecked: false,
    ),
  ];

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

  Widget _content() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 30.0),
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
            InputText(
              controller: _avatarController,
              hintText: 'Enter your photos (link). . .',
              label: 'Photo Profile',
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: defaultMarginSpace,
            ),
            Row(
              children: [
                Text(
                  'Status',
                  style: headingTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: bold,
                  ),
                ),
                SizedBox(
                  width: defaultMarginSpace,
                ),
                Expanded(
                  child: Container(
                    height: 45.0,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: silverColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _value,
                        items: _dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            child: Text(
                              item,
                              style: titleTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        hint: Text(
                          "Select item",
                          style: titleTextStyle.copyWith(
                            color: greyColor,
                            fontSize: 14,
                          ),
                        ),
                        disabledHint: Text(
                          "Disabled",
                          style: titleTextStyle.copyWith(
                            color: greyColor,
                            fontSize: 14,
                          ),
                        ),
                        elevation: 1,
                        style: titleTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        icon: const Icon(Icons.arrow_drop_down_rounded),
                        iconDisabledColor: tittleColor,
                        iconEnabledColor: primaryColor,
                        isExpanded: true,
                        dropdownColor: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: defaultMarginSpace,
            ),
            Text(
              'Choose your gender',
              style: headingTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: 'Laki - Laki',
                  groupValue: _selectedGender,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                Text(
                  'Laki - Laki',
                  style: titleTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<String>(
                  value: 'Perempuan',
                  groupValue: _selectedGender,
                  activeColor: primaryColor,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                Text(
                  'Perempuan',
                  style: titleTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: defaultMarginSpace,
            ),
            Text(
              'Choose your hobby',
              style: headingTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: bold,
              ),
            ),
            Column(
              children: List.generate(
                checkListItems.length,
                (index) => CheckboxListTile(
                  value: checkListItems[index].isChecked,
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    checkListItems[index].title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  onChanged: (isChecked) {
                    setState(() {
                      checkListItems[index].isChecked = isChecked!;
                      if (multipleSelected
                          .contains(checkListItems[index].title)) {
                        multipleSelected.remove(checkListItems[index].title);
                      } else {
                        multipleSelected.add(checkListItems[index].title);
                      }
                    });
                  },
                ),
              ),
            ),
            Text(
              multipleSelected.isEmpty
                  ? ""
                  : 'Hobi : ' + multipleSelected.join('').toString(),
              style: titleTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            PrimaryButton(
              text: 'Add Contact',
              press: () {
                if (_nameController.text.isEmpty ||
                    _phoneController.text.isEmpty ||
                    _avatarController.text.isEmpty ||
                    _selectedGender.isEmpty ||
                    _value.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Eits, Tidak boleh ada yang kosong!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: redColor,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  _addUsersData(
                    User(
                      name: _nameController.text,
                      phone: _phoneController.text,
                      avatar: _avatarController.text,
                      status: _value,
                      gender: _selectedGender == 'Laki - Laki'
                          ? 'Laki - Laki'
                          : 'Perempuan',
                      hobi: multipleSelected.join('').toString(),
                    ),
                  );
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
