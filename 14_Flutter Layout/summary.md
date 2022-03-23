# (13) Flutter Layout
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume :

### 1. Apa itu Flutter Layout
Flutter layout adalah sebuah widget yang tidak terlihat, kegunaanya sendiri untuk mengatur tata letak widget widget yang ada dalam flutter layout.

### 2. Single Child Layout
Single Child Layout hanya bisa menampung 1 (satu) buah child saja, misalnya : Padding, Container, Card, Expanded, Flexible, Center, GestureDetector, Positioned, SafeArea, SingleChildScrollView, dll.

### 3. Multi Child Layout 
Multi-Child Layout Widget digunakan untuk meletakkan child widget yang akan ditampilkan jika lebih dari satu, adapun widget ini terdiri dari: Column, Row, Flex, ListView, Stack. Layout ini baik digunakan untuk komponen yang sudah kita ketahui ukurannya, seperti buttons, textboxes, dll.

# Task
Pada task ini saya membuat dua layout, antara lain Listview dan GridView. Data yang saya gunakan untuk mengisi dari Listview dan Gridview ini saya dapatkan melalui get API [reqres.in](https://reqres.in/).

Berikut hasil dari praktikum ini : 

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/14_Flutter%20Layout/praktikum/ptaktikum_section_14)<br>
[View Secreenshot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/14_Flutter%20Layout/screenshot)

## Task 1 ListView
Pada task pertama ini saya membuat sebuah tampilan user yang saya susun secara vertical dan hanya satu row.

### Source Code :

```dart
// Properti API
var apiUrl = Uri.parse('https://reqres.in/api/users?per_page=20');

// Get data dari API secara asynchronous
Future<List<dynamic>> _fecthDataUsers() async {
  var result = await http.get(apiUrl);
  return json.decode(result.body)['data'];
}

// Menggunakan data API
FutureBuilder<List<dynamic>>(
    future: _fecthDataUsers(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
// Method Menampilkan data dari API secara Listview
        return ListView.builder(
            controller: controller,
            padding: const EdgeInsets.all(12.0),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
                return ListTile(
                key: const ValueKey('list'),
                leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(snapshot.data[index]['avatar']),
                ),
                title: Text(snapshot.data[index]['first_name'] +
                        " " +
                    snapshot.data[index]['last_name']),
                subtitle: Text(snapshot.data[index]['email']),
                );
            });
        } else {
/*Apabila data dari API masih mengunggu proses pengambilan 
data, makan akan menampikan CircularProgressIndicator*/
        return const Center(child: CircularProgressIndicator());
        }
    },
),
```

### Output :
![Output Task 1](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/14_Flutter%20Layout/screenshot/Output%20Task%201.png)

## Task 2 GridView
Pada task kedua ini saya membuat sebuah tampilan user yang saya susun menggunakan GridView.

### Source Code :

```dart
// Properti API
var apiUrl = Uri.parse('https://reqres.in/api/users?per_page=20');

// Method Get data dari API secara asynchronous
Future<List<dynamic>> _fecthDataUsers() async {
  var result = await http.get(apiUrl);
  return json.decode(result.body)['data'];
}

// Menggunakan data API
FutureBuilder<List<dynamic>>(
    future: _fecthDataUsers(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
// Menampilkan data dari API pada GridView
        return GridView.builder(
            controller: controller,
            padding: const EdgeInsets.all(10),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
            return GridCard(
                avatar: NetworkImage(snapshot.data[index]['avatar']),
                firstname: snapshot.data[index]['first_name'],
                lastname: snapshot.data[index]['first_name'],
                email: snapshot.data[index]['email'],
            );
        },
        shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Code pada baris ini berguna untuk menentukan berapa banyak data yang akan di tampilkan secara horizontal/
            childAspectRatio: 1.0,
            ),
        );
        } else {
/*Apabila data dari API masih mengunggu proses pengambilan 
data, makan akan menampikan CircularProgressIndicator*/
        return const Center(child: CircularProgressIndicator());
        }
    },
),
```

### Output : 
![Output Task 2]([screenshot/Output%20Task%202.png](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/blob/main/14_Flutter%20Layout/screenshot/Output%20Task%202.png))