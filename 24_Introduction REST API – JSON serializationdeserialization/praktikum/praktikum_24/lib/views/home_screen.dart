import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/contact_card.dart';
import '../components/outline_icon_button.dart';
import '../models/contact_model.dart';
import '../providers/contact_provider.dart';
import '../themes/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ContactProvider>(context, listen: false).getContacts();
  }

  String? whatHappened;

  AppBar _header(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMarginAppBar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineIconsButton(
              icons: 'assets/icons/dashboard.svg',
              press: () {},
            ),
            Text(
              'Contact',
              style: headingTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            OutlineIconsButton(
              icons: 'assets/icons/add.svg',
              press: () {
                Navigator.pushNamed(context, '/add-contact');
              },
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(displayHeight(context) * 0.07),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              height: 45.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5.0,
                    offset: Offset(0.0, 1.0),
                  ),
                ],
                color: silverColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                style: titleTextStyle.copyWith(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  isDense: true,
                  hintText: 'Search...',
                  hintStyle: titleTextStyle.copyWith(
                    color: greyColor,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            primaryColor,
                            secondaryColor,
                          ],
                        ),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(ctx) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMarginBody,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: defaultMarginSpace,
            ),
            child: Text(
              'My Contact',
              style: headingTextStyle.copyWith(
                fontSize: 20.0,
                fontWeight: bold,
              ),
            ),
          ),
          SizedBox(height: defaultMarginSpace - 10.0),
          Expanded(
            child: contactProvider.contacts.isEmpty
                ? Center(
                    child: LoadingAnimationWidget.discreteCircle(
                      color: primaryColor,
                      size: 50.0,
                    ),
                  )
                : ListView.builder(
                    itemCount: contactProvider.contacts.length,
                    itemBuilder: (ctx, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          contactProvider.deleteContact(index);
                          // ignore: deprecated_member_use
                          Scaffold.of(ctx).showSnackBar(
                            SnackBar(
                              backgroundColor: redColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              content: Text(
                                "${contactProvider.contacts[index].name} berhasil di $whatHappened",
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                        direction: DismissDirection.endToStart,
                        background: Expanded(
                          child: Row(
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
                                      color: redColor,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          ),
                        ),
                        confirmDismiss:
                            (DismissDirection dismissDirection) async {
                          switch (dismissDirection) {
                            case DismissDirection.endToStart:
                              whatHappened = 'Hapus!';
                              return await _showConfirmationDialog(
                                      context, 'Hapus') ==
                                  true;
                            case DismissDirection.startToEnd:
                              whatHappened = 'DELETED';
                              return await _showConfirmationDialog(
                                      context, 'Delete') ==
                                  true;
                            case DismissDirection.horizontal:
                            case DismissDirection.vertical:
                              break;
                            case DismissDirection.up:
                              break;
                            case DismissDirection.down:
                              break;
                            case DismissDirection.none:
                              break;
                          }
                          return false;
                        },
                        child: GestureDetector(
                          onTap: (() {
                            // DetailContact(ctx, contactProvider.userLoad[index]);
                          }),
                          child: ContactCard(
                            name: contactProvider.contacts[index].name!,
                            phone: contactProvider.contacts[index].phone!,
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Scaffold(
      appBar: _header(context),
      body: _content(context),
    );
  }
}

Future<bool?> _showConfirmationDialog(BuildContext ctx, String action) {
  return showDialog<bool>(
    context: ctx,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: silverColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        title: Text(
          'Sudah yakin mau $action kontak ini?',
          style: headingTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: bold,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Ya',
              style: primaryTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: semiBold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, true); // showDialog() returns true
            },
          ),
          TextButton(
            child: Text(
              'Batal',
              style: primaryTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: semiBold,
              ),
            ),
            onPressed: () {
              Navigator.pop(context, false); // showDialog() returns false
            },
          ),
        ],
      );
    },
  );
}
