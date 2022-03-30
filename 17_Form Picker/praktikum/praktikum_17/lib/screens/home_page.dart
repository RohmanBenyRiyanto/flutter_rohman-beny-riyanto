import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:praktikum_17/screens/detail_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/app_bar_sapace.dart';
import '../components/input_text.dart';
import '../components/outline_icon_button.dart';
import '../components/primary_button.dart';
import '../themes/theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _captionController = TextEditingController();
  File? imageFile;
  DateTime date = DateTime.now();
  Color color = primaryColor;

  void _clearImage() {
    setState(() {
      imageFile = null;
    });
  }

  void _setDate() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      setState(() {
        date = newDate;
      });
    }
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
              press: () {},
            ),
            Text(
              'Form Picker',
              style: headingTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            const AppBarSpace()
          ],
        ),
      ),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMarginBody,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Cover',
              style: headingTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: defaultMarginSpace),
            Container(
              height: displayHeight(context) * 0.23,
              width: double.infinity,
              decoration: BoxDecoration(
                color: blackColor,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: black2Color.withAlpha(50),
                    offset: const Offset(0, 2),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: imageFile == null
                  ? Center(
                      child: Text(
                        'LOH HEH KOSONG?\nPasti Belum Upload Foto!',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Container(
                      height: displayHeight(context) * 0.23,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: black2Color.withAlpha(50),
                            offset: const Offset(0, 2),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
            SizedBox(height: defaultMarginSpace),
            imageFile == null
                ? PrimaryButton(
                    text: 'Upload Foto',
                    press: () {
                      _getFromGallery();
                    },
                  )
                : PrimaryButton(
                    text: 'Hapus Foto',
                    press: () {
                      _clearImage();
                    },
                  ),
            SizedBox(height: defaultMarginSpace),
            Text(
              'Publish At',
              style: headingTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: defaultMarginSpace),
            PrimaryButton(
              text: '${date.day} - ${date.month} - ${date.year}',
              press: () async {
                _setDate();
              },
            ),
            SizedBox(height: defaultMarginSpace),
            Text(
              'Color Theme',
              style: headingTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: defaultMarginSpace),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: 'Pilih Warna',
                    press: () {
                      _pickColor(context);
                    },
                  ),
                ),
                SizedBox(width: defaultMarginSpace),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(height: defaultMarginSpace),
            Text(
              'Caption',
              style: headingTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: bold,
              ),
            ),
            SizedBox(height: defaultMarginSpace),
            InputText(
              controller: _captionController,
              hintText: 'Apa yang anda pikirkan?',
              keyboardType: TextInputType.multiline,
              label: 'sfsf',
            ),
            SizedBox(height: defaultMarginSpace),
            PrimaryButton(
              text: 'Simpan',
              press: () {
                if (imageFile == null) {
                  Fluttertoast.showToast(
                    msg: 'Anda belum memilih foto!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: redColor,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else if (_captionController.text.isEmpty) {
                  Fluttertoast.showToast(
                    msg: 'Anda belum mengisi caption!',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: redColor,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        imageFile: imageFile!,
                        date: date,
                        color: color,
                        caption: _captionController.text.toString(),
                      ),
                    ),
                  );
                  Fluttertoast.showToast(
                    msg: 'Data berhasil disimpan.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: greenColor,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
            ),
            SizedBox(height: defaultMarginSpace),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      backgroundColor: whiteColor,
      body: _content(),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  Widget buildColorPicker() {
    return ColorPicker(
      pickerColor: color,
      showLabel: false,
      onColorChanged: (color) => setState(() => this.color = color),
    );
  }

  void _pickColor(BuildContext contex) => showDialog(
        context: context,
        builder: (contex) => AlertDialog(
          title: Text(
            'Pilih Warna',
            style: headingTextStyle.copyWith(
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildColorPicker(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Pilih Warna',
                  style: headingTextStyle.copyWith(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
