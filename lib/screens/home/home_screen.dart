import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quoteworld/screens/quotes/bloc/quotes_bloc.dart';
import 'package:quoteworld/screens/search/search_screen.dart';
import 'package:quoteworld/widgets/like_badge.dart';
import '../../blocs/search_bloc/search_bloc.dart';
import '../../crud/moor_curd.dart';
import '../../crud/quote_crud/quote_crud.dart';
import '../quotes/quotes_screen.dart';

enum ItemType { quote, phrase, idiom }

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  final quoteDao = QuoteDao(AppDatabase());
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  FocusNode focusNode = FocusNode();
  bool isSearchFocus = false;
  @override
  void initState() {
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
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
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
                            child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                textCapitalization: TextCapitalization.words,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.withOpacity(.7)),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                  border: InputBorder.none,
                                  suffixIcon: const Icon(
                                    Icons.search,
                                    size: 30,
                                    color: Colors.lightBlue,
                                  ),
                                ),
                                onChanged: (value) {
                                  BlocProvider.of<SearchBloc>(context).add(
                                      SearchScreenFocus(value, ItemType.quote));
                                }),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        LikeBadge()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .017,
                  ),
                  Expanded(
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: BlocBuilder<SearchBloc, SearchState>(
                            builder: (context, state) {
                              return state is SearchLoadingInProgress ||
                                      state is SearchItemLoaded
                                  ? const SearchSCreen()
                                  : const QuotesScreen();
                            },
                          )))
                ])));
  }
}
