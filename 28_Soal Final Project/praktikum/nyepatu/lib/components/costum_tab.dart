import 'package:flutter/material.dart';

import '../themes/theme.dart';

class CostumTab extends StatelessWidget {
  const CostumTab({
    Key? key,
    required this.labels,
  }) : super(key: key);

  final String labels;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: purpleOneColor,
            width: 2,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(labels),
        ),
      ),
    );
  }
}
