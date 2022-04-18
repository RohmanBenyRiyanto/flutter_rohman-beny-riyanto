import 'package:flutter/material.dart';

import '../themes/theme.dart';

class DismissibleBg extends StatelessWidget {
  const DismissibleBg({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 4,
          child: Container(),
        ),
        Flexible(
          flex: 1,
          child: Container(
            width: displayWidth(context),
            decoration: BoxDecoration(
                color: redColor, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
