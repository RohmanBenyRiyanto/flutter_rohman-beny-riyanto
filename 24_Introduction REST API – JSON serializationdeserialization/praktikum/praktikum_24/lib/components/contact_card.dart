import 'package:flutter/material.dart';

import '../themes/theme.dart';

// ignore: must_be_immutable
class ContactCard extends StatefulWidget {
  late String name;
  late String phone;

  ContactCard({
    Key? key,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: headingTextStyle.copyWith(
                  fontSize: 16.0,
                  fontWeight: semiBold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 2.0,
              ),
              Text(
                widget.phone,
                style: subtitleTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
