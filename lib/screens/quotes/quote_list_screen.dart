// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoteworld/screens/quotes/bloc/quotes_bloc.dart';
import 'package:quoteworld/screens/quotes/widgets/categories_item_list.dart';

import 'package:shimmer/shimmer.dart';

import '../../blocs/search_bloc/search_bloc.dart';
import '../../widgets/social_share.dart';

class QuotesListScreen extends StatefulWidget {
  final CategoryItem? category;
  const QuotesListScreen({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  State<QuotesListScreen> createState() => _QuotesListScreenState();
}

class _QuotesListScreenState extends State<QuotesListScreen> {
  late PageController _scrollController;

  int pageNo = 1;
  @override
  void initState() {
    BlocProvider.of<QuotesBloc>(context).add(LoadQuotesEvent(
        quotesURL: widget.category!.screen_link! + pageNo.toString()));
    _scrollController = PageController()..addListener(() {});

    super.initState();
  }

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
            body: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, searchState) {
                return BlocBuilder<QuotesBloc, QuotesState>(
                  builder: (context, state) {
                    return Column(children: [
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
                              widget.category!.category_Name!,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 40,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .01,
                      ),
                      searchState is SearchFous
                          ? Container()
                          : Expanded(
                              child: PageView.builder(
                              controller: _scrollController,
                              itemCount: state is QuotesLoadingState ||
                                      state is QuotesInitial
                                  ? state.quotes.length + 1
                                  : state.quotes.length,
                              onPageChanged: (value) {
                                if (state.quotes.length <= value + 1) {
                                  pageNo++;
                                  BlocProvider.of<QuotesBloc>(context).add(
                                      LoadQuotesEvent(
                                          quotesURL:
                                              widget.category!.screen_link! +
                                                  pageNo.toString()));
                                }
                              },
                              itemBuilder: (context, index) {
                                if (index >= state.quotes.length) {
                                  return Padding(
                                    padding: const EdgeInsets.all(24.0)
                                        .copyWith(bottom: 12),
                                    child: Container(
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
                                      child: Column(children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .05,
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .17,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(.3),
                                                  blurRadius: 4.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .05,
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .1),
                                            child: Container(
                                              height: 25,
                                              width: double.infinity,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .2),
                                            child: Container(
                                              height: 25,
                                              width: double.infinity,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .015,
                                        ),
                                        Shimmer.fromColors(
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .12),
                                            child: Container(
                                              height: 25,
                                              width: double.infinity,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Expanded(child: Container()),
                                        Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 18, vertical: 12),
                                            child: SocialShareRow(
                                              content: "",
                                              ontap: () {},
                                              type: '',
                                            ))
                                      ]),
                                    ),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(24.0)
                                      .copyWith(bottom: 12),
                                  child: Container(
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
                                    child: Column(children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .05,
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .17,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .35,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(.3),
                                              blurRadius: 4.0,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: state.quotes[index].imageUrl ==
                                                null
                                            ? const Icon(
                                                Icons.person,
                                                size: 70,
                                                color: Colors.grey,
                                              )
                                            : Image.network(
                                                state.quotes[index].imageUrl!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24),
                                            child: Column(
                                              children: [
                                                Text(
                                                    state
                                                        .quotes[index].content!,
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts.ranga(
                                                        textStyle: TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: colors[
                                                                index % 10]))),
                                                Text(
                                                  "~${state.quotes[index].quoteWriter}",
                                                  style: GoogleFonts.montserrat(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.grey)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 12),
                                          child: SocialShareRow(
                                            content:
                                                "${state.quotes[index].content!}\n${state.quotes[index].quoteWriter}",
                                            ontap: () {},
                                            type: '',
                                          ))
                                    ]),
                                  ),
                                );
                              },
                            )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                    ]);
                  },
                );
              },
            )));
  }
}
