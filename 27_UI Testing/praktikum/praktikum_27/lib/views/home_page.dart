import 'package:flutter/material.dart';
import 'package:praktikum_25/views/views_model/view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var viewModel = Provider.of<FoodViewModel>(context, listen: false);
      await viewModel.fetchFoods();
    });
  }

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
        title: const Text('Foods'),
      ),
      body: body(viewModel),
    );
  }
}
