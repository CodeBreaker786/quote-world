import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoteworld/crud/moor_curd.dart';
import 'package:quoteworld/crud/quote_crud/quote_crud.dart';
import 'package:quoteworld/screens/quotes/widgets/categories_item_list.dart';
import 'package:quoteworld/screens/quotes/widgets/quote_detail_screen.dart';

class LikesScreen extends StatefulWidget {
  LikesScreen({Key? key}) : super(key: key);
  final quoteDao = QuoteDao(AppDatabase());
  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
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
                        const Text(
                          "Liked Quotes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 40,
                        )
                      ])),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: StreamBuilder<List<Item>>(
                            stream: widget.quoteDao.watchAllQuotes(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.active &&
                                  snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuoteDetail(
                                                        item: snapshot
                                                            .data![index],
                                                        appBarTitle:
                                                            'Saved Quote',
                                                      )));
                                        },
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(.1),
                                                  blurRadius: 2,
                                                  offset: Offset.zero),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            color: colors[index % 10]
                                                .withOpacity(.15),
                                          ),
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .15,
                                            color: Colors.transparent,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    height: 72,
                                                    width: 64,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(.3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12)),
                                                    child: snapshot.data![index]
                                                                .imageUrl !=
                                                            null
                                                        ? Image.network(
                                                            snapshot
                                                                .data![index]
                                                                .imageUrl!,
                                                            fit: BoxFit.cover,
                                                          )
                                                        : const Center(
                                                            child: Icon(
                                                              Icons
                                                                  .perm_identity_sharp,
                                                              color:
                                                                  Colors.white,
                                                              size: 40,
                                                            ),
                                                          ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          snapshot.data![index]
                                                              .quoteWriter,
                                                          style: GoogleFonts
                                                              .fredokaOne(
                                                                  fontSize: 18),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            snapshot
                                                                .data![index]
                                                                .content!,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              }
                              return const Icon(
                                FontAwesomeIcons.heart,
                                color: Colors.red,
                              );
                            })),
                  ),
                ),
              ),
            ])));
  }
}
