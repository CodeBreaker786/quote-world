import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoteworld/crud/moor_curd.dart';
import 'package:quoteworld/crud/quote_crud/quote_crud.dart';

import 'package:quoteworld/widgets/social_share.dart';

import 'categories_item_list.dart';

class QuoteTile extends StatefulWidget {
  final int? index;
  final Item quote;

  final quoteDao = QuoteDao(AppDatabase());

  QuoteTile({super.key, this.index, required this.quote});

  @override
  State<QuoteTile> createState() => _QuoteTileState();
}

class _QuoteTileState extends State<QuoteTile> {
  bool isLiked = false;
  @override
  void initState() {
    isLiked = widget.quote.isLiked;
    super.initState();
  }

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
                          icon: Icon(
                            isLiked
                                ? FontAwesomeIcons.solidHeart
                                : FontAwesomeIcons.heart,
                            color: Colors.red,
                          ),
                          callback: () async {
                            setState(() {
                              isLiked = !isLiked;
                            });
                            if (isLiked) {
                              await widget.quoteDao.insertQuote(
                                  widget.quote.copyWith(isLiked: true));
                            } else {
                              await widget.quoteDao.deleteQuote(widget.quote);
                            }
                          },
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
                    child: widget.quote.imageUrl == null
                        ? const Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.grey,
                          )
                        : Image.network(
                            widget.quote.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Text(widget.quote.content!,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.ranga(
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: colors[Random().nextInt(10) % 10]))),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "~${widget.quote.quoteWriter}",
                          style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        widget.index != null
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.arrow_back_ios_new),
                                  Text(
                                    " ${widget.index} ",
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
                    content:
                        "${widget.quote.content!}\n${widget.quote.quoteWriter}",
                    ontap: () {},
                    type: '',
                  )),
            ))
      ],
    );
  }
}
