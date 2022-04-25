# (25) MVVM Architecture
| NAMA |  KELAS
|--|--|
| Rohman Beny Riyanto  |  Flutter A

## Hasil Resume

### 1. Finite State Machine
Finite State Machine adalah sebuah proses yang akan menunjukkan setiap tahap dalam proses berjalanya suatu program, seperti contohnya saat melakukan get reques dari flutter ke api.
Dalam proses tersebut terdapat beberapa state atau tahapan, seperti halnya iddle, loading, error.

### 2. Widget with finite state
Hal ini merupakan penerapan proses-proses state tersebut pada sebuah widget yang ada pada flutter, Contohnya adalah sebuah proses get api akan di lakukan pertama yaitu loading state yang berisi cirucular progres indicator, sembari loading flutter akan melakukan get request pada api. Ketika api berhasil di ambil akan menampilkan data pada sebuah widget yang sudah di tentukan, namun apabila state gagal mendapatkan data dari api, state akan mengembalikan sebuah widget yang menunjukan error atau gagal melakukan get data dari api tersebut.

### Unit testing
Unit testing dalam flutter terdapat pada folder test pada root directory project flutter, file test selalu bernama dengan formal _test.dart. Test ini digunakan untuk melakukan percobaan dan memastikan bahwa code atau program flutter yang sudah dibuah berjalan lancar tanpa menggunakan widget.

# Task 
Pada Task ini saya membuat sebuah aplikasi yang melakukan get request pada api yang berisi data tentang makanan, proses tersebut menrapkan MVVVP dan finite state juga unit testing.

Berikut hasil dari praktikum ini :

[View Program](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/26_Finite%20State%20Machine%20Dan%20Unit%20Testing/praktikum/praktikum_26)<br>
[View ScreenShoot](https://github.com/RohmanBenyRiyanto/flutter_rohman-beny-riyanto/tree/main/26_Finite%20State%20Machine%20Dan%20Unit%20Testing/screenshot)

## Source Code

### Task 1
```dart
// NOTE : Object foods
import 'dart:convert';

class FoodModel {
  int? id;
  String? name;

  FoodModel({
    this.id,
    this.name,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toJson(FoodModel user) => {
        'id': user.id,
        'name': user.name,
      };

  static String encode(List<FoodModel> userList) => json.encode(
        userList
            .map<Map<String, dynamic>>((us) => FoodModel.toJson(us))
            .toList(),
      );

  static List<FoodModel> decode(String userList) =>
      (json.decode(userList) as List<dynamic>)
          .map<FoodModel>((item) => FoodModel.fromJson(item))
          .toList();
}

// NOTE : FOOD API (Proses yang terhubung pada API)
class FoodServices {
  String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods';

  Future<List<FoodModel>> getFoods() async {
    Response<List<dynamic>> response = await Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 3000,
        receiveTimeout: 3000,
      ),
    ).get(baseUrl);
    if (response.statusCode == 200) {
      List<FoodModel>? foodsList =
          response.data?.map((items) => FoodModel.fromJson(items)).toList();
      print('foods: ${response.data}');
      return foodsList ?? [];
    }
    return [];
  }
}

// NOTE : View Model (Menggunakan provider)
enum FoodViewState { idle, loading, error }

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.idle;

  FoodViewState get state => _state;

  List<FoodModel> _foods = [];

  List<FoodModel> get foods => _foods;

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  fetchFoods() async {
    changeState(FoodViewState.loading);
    notifyListeners();
    try {
      List<FoodModel> products = await FoodServices().getFoods();
      _foods = products;
      notifyListeners();

      changeState(FoodViewState.idle);
    } catch (e) {
      changeState(FoodViewState.error);
    }
    notifyListeners();
  }
}

// Menampilkan pada widget
Widget body(FoodViewModel viewModel) {
    final isLoading = viewModel.state == FoodViewState.loading;
    final isError = viewModel.state == FoodViewState.error;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isError) {
      return const Center(
        child: Text(
          'Failed to load foods',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: viewModel.foods.length,
        itemBuilder: (context, index) {
          final food = viewModel.foods[index];
          return ListTile(
            leading: Text(
              food.id.toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            title: Text(food.name!),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    FoodViewModel viewModel = Provider.of<FoodViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Foods List'),
      ),
      body: body(viewModel),
    );
  }
```

### Task 2
```dart

@GenerateMocks([FoodServices])
void main() {
  FoodServices foodsServices = MockFoodServices();

  group('FoodsAPI', () {
    test('get all foods return data', () async {
      when(foodsServices.getFoods()).thenAnswer((_) async => <FoodModel>[
            FoodModel(
              id: 1,
              name: 'Test Food 1',
            ),
          ]);
      var foods = await foodsServices.getFoods();
      expect(foods.isNotEmpty, true);
    });

    test('get state loading', () {
      FoodViewModel viewModel = FoodViewModel();
      viewModel.changeState(FoodViewState.loading);
      expect(viewModel.state, FoodViewState.loading);
    });
    test('get state error', () {
      FoodViewModel viewModel = FoodViewModel();
      viewModel.changeState(FoodViewState.error);
      expect(viewModel.state, FoodViewState.error);
    });
  });
}
```

## Output 

### Loading :

<img src="screenshot/Output%20When%20Loading.png" width="400">

### Idle
<img src="screenshot/Output%20When%20Succes%20(Idle).png" width="400">

### Error

<img src="screenshot/Output%20When%20Error.png" width="400">

### Test

<img src="screenshot/Output%20Tests.png" width="900">