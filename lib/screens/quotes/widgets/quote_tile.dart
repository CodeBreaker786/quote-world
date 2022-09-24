import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoteworld/crud/moor_curd.dart';

import 'package:quoteworld/widgets/social_share.dart';

import 'categories_item_list.dart';

class QuoteTile extends StatelessWidget {
  final int? index;
  final Item quote;
  const QuoteTile({super.key, this.index, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(24.0).copyWith(bottom: 12),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 4.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(40),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buildShareTileIconCard(
                          icon: const Icon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                          ),
                          callback: () {},
                        ),
                      ],
                    ),
                  ),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: MediaQuery.of(context).size.height * .17,
                    width: MediaQuery.of(context).size.width * .35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.3),
                          blurRadius: 4.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: quote.imageUrl == null
                        ? const Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.grey,
                          )
                        : Image.network(
                            quote.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(quote.content!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ranga(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: colors[Random().nextInt(10) % 10]))),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "~${quote.quoteWriter}",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        index != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.arrow_back_ios_new),
                                  Text(
                                    " $index ",
                                    style: GoogleFonts.montserrat(
                                        textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    )),
                                  ),
                                  const Icon(Icons.arrow_forward_ios),
                                ],
                              )
                            : Container(),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24).copyWith(bottom: 12),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 4.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                  child: SocialShareRow(
                    content: "${quote.content!}\n${quote.quoteWriter}",
                    ontap: () {},
                    type: '',
                  )),
            ))
      ],
    );
  }
}
