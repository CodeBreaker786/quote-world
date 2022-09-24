// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quoteworld/screens/quotes/bloc/quotes_bloc.dart';
import 'package:quoteworld/screens/quotes/widgets/categories_item_list.dart';
import 'package:quoteworld/screens/quotes/widgets/quote_loading_tile.dart';
import 'package:quoteworld/screens/quotes/widgets/quote_tile.dart';

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
            body: BlocBuilder<QuotesBloc, QuotesState>(
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
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
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
                  Expanded(
                      child: PageView.builder(
                    controller: _scrollController,
                    itemCount:
                        state is QuotesLoadingState || state is QuotesInitial
                            ? state.quotes.length + 1
                            : state.quotes.length,
                    onPageChanged: (value) {
                      if (state.quotes.length <= value + 1) {
                        pageNo++;
                        BlocProvider.of<QuotesBloc>(context).add(
                            LoadQuotesEvent(
                                quotesURL: widget.category!.screen_link! +
                                    pageNo.toString()));
                      }
                    },
                    itemBuilder: (context, index) {
                      if (index >= state.quotes.length) {
                        return const QuoteLoadingTile();
                      }
                      return QuoteTile(
                          index: index + 1, quote: state.quotes[index]);
                    },
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                ]);
              },
            )));
  }
}
