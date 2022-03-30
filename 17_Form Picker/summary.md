# (17) Form Picker
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Date Picker
Date Picker adalah sebuah widget yang dimana pengguna dapat dengan mudah memilih satu tanggal, beberapa tanggal, atau rentang tanggal . Untuk membatasi pemilihan tanggal, juga dapat mengatur jumlah hari minimum atau maksimum yang dapat dipilih oleh pengguna. Selain itu juga dapat mematikan atau membatasi hari untuk mencegah pengguna memilihnya.

### 2. Color Picker
Color picker adalah sebuah widget yang dapat mengatur warna apapaun, pengguna pun dapat langsung memilih warna sesuai yang di inginkan.

### 3. File Picker
File Picker adalah jalan untuk user agar dapat terhubung antara aplikasi dengan storage local dari device user, karena file picker dapat digunakan untuk mengambil data foto, video maupun file - file lainya.

# Task
Pada task kali ini saya membuat sebuah aplikasi form picker yang berisi, image picker, color picker, date picker, dan input text. Data data tersebut saya pass atau saya kirim dari page 1 ke page 2.

Berikut hasil dari pratikum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/17_Form%20Picker/praktikum/praktikum_17)<br>
[View Secreenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/17_Form%20Picker/screenshot)

## Pembahasan

### Source Code : 
```dart
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
// Image picker
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
// Date picker
                        PrimaryButton(
              text: '${date.day} - ${date.month} - ${date.year}',
              press: () async {
                _setDate();
              },
            ),
// Pilih warna
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

                 InputText(
              controller: _captionController,
              hintText: 'Apa yang anda pikirkan?',
              keyboardType: TextInputType.multiline,
              label: 'sfsf',
            ),

// Submit data ke page baru
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
```

### Output :
<img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/17_Form%20Picker/screenshot/Create%20Post.jpg" width="400"> 
<img src="https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/17_Form%20Picker/screenshot/Halaman%20Baru.jpg" width="400"> 

