import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quoteworld/crud/moor_curd.dart';
import 'package:quoteworld/crud/quote_crud/quote_crud.dart';

import '../screens/likes_screen.dart';

class LikeBadge extends StatelessWidget {
  LikeBadge({Key? key}) : super(key: key);
  final quoteDao = QuoteDao(AppDatabase());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: StreamBuilder<List<Item>>(
              stream: quoteDao.watchAllQuotes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.data!.isNotEmpty) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LikesScreen()));
                    },
                    child: Badge(
                      badgeContent: Text(snapshot.data!.length.toString()),
                      child: const Icon(
                        FontAwesomeIcons.heart,
                        color: Colors.red,
                      ),
                    ),
                  );
                }
                return const Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.red,
                );
              })),
    );
  }
}
