import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodePage extends StatelessWidget {
  const BarcodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Barcode Page',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: BarcodeWidget(
                  barcode: Barcode.code128(
                      escapes: true), // BarcodePag type and settings
                  data: 'Alterra Academy', // Content
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 1,
                child: BarcodeWidget(
                  barcode: Barcode.code128(
                      escapes: true), // BarcodePag type and settings
                  data: 'Fluter Asik', // Content
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                flex: 1,
                child: BarcodeWidget(
                  barcode: Barcode.code128(
                      escapes: true), // BarcodePag type and settings
                  data: 'Rohman Beny Riyanto', // Content
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
