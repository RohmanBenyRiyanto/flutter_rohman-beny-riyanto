import 'package:flutter/material.dart';

import 'package:praktikum_15/model.dart';

import '../theme/theme.dart';

class DetailScreen extends StatelessWidget {
  final ImageModel imageModel;

  const DetailScreen({
    Key? key,
    required this.imageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        title: const Text('Detail Screen'),
      ),
      body: Center(
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
    );
  }
}
