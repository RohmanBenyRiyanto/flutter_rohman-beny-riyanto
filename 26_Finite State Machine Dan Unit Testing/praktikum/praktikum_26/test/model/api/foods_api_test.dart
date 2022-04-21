import 'package:praktikum_25/models/food_model.dart';
import 'package:praktikum_25/models/food_services/food_services.dart';
import 'package:praktikum_25/views/views_model/view_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'foods_api_test.mocks.dart';

// NOTE : Normal Test Case
// void main() {
//   test('get all foods return data', () async {
//     var foods = await FoodServices().getFoods();
//     expect(foods.isNotEmpty, true);
//   });
// }

// NOTE : Group Test Case

// void main() {
//   group('FoodsAPI', () {
//     test('get all foods return data', () async {
//       var foods = await FoodServices().getFoods();
//       expect(foods.isNotEmpty, true);
//     });
//   });
// }

// NOTE : Mocks Test Case
@GenerateMocks([FoodServices])
void main() {
  FoodServices foodsServices = MockFoodServices();
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

  
}
