# (14) Assets (Change To Section 18)
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Apa itu Assets Flutter
Assets pada framework flutter adalah sebuah file yang digunakan dalam aplikasi flutter, jenis - jenis flutter assets pun sangat beragam. Jenis aset yang umum mencakup data statis (misalnya, file JSON), file konfigurasi, ikon, dan gambar (JPEG, WebP, GIF, WebP/GIF animasi, PNG, BMP, dan WBMP).

### 2. Cara menambahkan Assets
Flutter menggunakan pubspec.yaml file, terletak pada stuktur proyek flutter, untuk mengidentifikasi assets yang diperlukan oleh aplikasi.<br>
Berikut ini contohnya :

```dart
flutter:
  assets:
    - assets/my_icon.png
    - assets/background.png
```

Untuk memasukkan semua aset di bawah direktori, tentukan nama direktori dengan /karakter di akhir :

```dart
flutter:
  assets:
    - directory/
    - directory/subdirectory/
```

### 3. Cara menampikan assets
Cara menampilkan assets dalam flutter pun sangat beragam tergantung pada type - type filenya, salah satunya yang sering digunakan adalah file bertype jpg, png, svg dll.

Contoh penggunaan file gambar pada flutter : 

```dart
// Gambar dari assets lokal yang sudah di daftarkan pada pubspec.yaml
Image.asset('assets/images/nama_gambar.type file'),

// Gambar dari internet
Image.network('link gambar');
```

# Task 
Pada task ini saya membuat sebuah gallery aplikasi yang di dalamnya terdapat gambar - gambar dari internet, gambar tersebut saya tampilkan menggunakan GridView. Adapun ketentuan pada task ini seperti, apabila gambar ditekan akan berpindah pada halaman lain dan gambar akan di tampikan pada halaman baru tersebut.

Berikut hasil dari task ini :
[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/15_Assets(Changed%20to%2018)/praktikum/praktikum_15)<br>
[View Secreenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/15_Assets(Changed%20to%2018)/screenshot)

## 1. Task Nomor 1
Pada task ini saya menampikna gambar dari internet, menggunakan sebuah package StaggeredGridView yang saya dapatkan dari [pub.dev](https://pub.dev). Library ini pada dasarnya sama saja dengan gridview pada umumnya, namun yang menjadi pembeda adalah tata letak dan ukuran gridview ini dapat di costum sedemikian rupa dapat dilihat pada output di bawah ini :

### Source Code :
```dart
// Class Image model
class ImageModel {
  late String imageUrl;
  ImageModel({
    required this.imageUrl,
  });
}

// List gambar yang bertype sring karena gambar dari internet digunakan menggunakan link
class _HomeScreenState extends State<HomeScreen> {
  static List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];

// Menambahkan isi dari list imageList kedalam imageModel
final List<ImageModel> ImageUrl = List.generate(
    imageList.length, (index) => ImageModel(imageUrl: imageList[index]));

// Split widget content yang isinya adalah gridview yang akan menampikan gambar dari list di atas
  Widget content() {
    return Container(
        margin: EdgeInsets.only(top: 20.0, left: defaultMargin),
        // Memanggil package yang sudah di daftarkan pada pubspec.yaml
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: ImageUrl.length, // Mengatur benyak nya item oada gridview sesuai dengan item pada list
          itemBuilder: (BuildContext context, int index) => GestureDetector( /*Gestur decetor untuk melakukan
          perpindaan halaman atau aksi apabila gambar di tekan*/
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(imageModel: ImageUrl[index]))); /*Berpinda pada halaman baru membawa data
                      dari list image yang di tekan*/
            },
            // Menampilkan gambar dengan type network karena gambar berupa link
            child: Image.network(
              ImageUrl[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          // Mengatur tampilan dari gridview
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        controller: controller,
        child: SafeArea(
         // Melakikan pemanggilan widget content pada body HomePage
          child: content(),
        ),
      ),
    );
  }
```

### Output :
![image](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/15_Assets(Changed%20to%2018)/screenshot/Home%20Page.jpg)

## 1. Task Nomor 2
Pada task kedua ini saya membuat agar gambar berpindah pada halaman baru ketika di tekan, gambar pun akan di tampikan pada halaman baru dengan ukuran sebesar layar.

### Source Code :
```dart
// Code di on tap ini terdapat pada class Homepage
onTap: () {
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) =>
        DetailScreen(imageModel: ImageUrl[index]))); /*Berpinda pada halaman baru membawa data
        dari list image yang di tekan*/
},

// Code pada class Detail Page
/*Properti image model yang nantinya akan di isi dengan gambar dari
list pada Home page class ketika DetailScreen di panggil*/
final ImageModel imageModel;

// Constuctor properti imageModel
const DetailScreen({
required this.imageModel,
});

// Menampikan gambar
Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageModel.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
```

### Output :
![](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/15_Assets(Changed%20to%2018)/screenshot/Detail%20Page.jpg)
