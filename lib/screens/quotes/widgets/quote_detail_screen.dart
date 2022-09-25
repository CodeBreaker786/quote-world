import 'package:flutter/material.dart';

import 'package:quoteworld/crud/moor_curd.dart';
import 'package:quoteworld/screens/quotes/widgets/quote_tile.dart';

class QuoteDetail extends StatelessWidget {
  final Item item;
  final String appBarTitle;

  const QuoteDetail({Key? key, required this.item, required this.appBarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromARGB(255, 212, 192, 227),
              Color.fromARGB(255, 184, 224, 236),
              Color.fromARGB(255, 143, 206, 251)
            ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                tileMode: TileMode.clamp)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.blue,
                              size: 30,
                            )),
                        Text(
                          appBarTitle,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 40,
                        )
                      ])),
              Expanded(child: QuoteTile(quote: item)),
            ])));
  }
}
