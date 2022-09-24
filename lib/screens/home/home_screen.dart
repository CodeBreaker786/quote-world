import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quoteworld/screens/search/search_screen.dart';

import '../../blocs/search_bloc/search_bloc.dart';
import '../quotes/quotes_screen.dart';

enum ItemType { quote, phrase, idiom }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  FocusNode focusNode = FocusNode();
  bool isSearchFocus = false;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  getItemType() {
    switch (tabController.index) {
      case 0:
        return ItemType.quote;
      case 1:
        return ItemType.phrase;
      case 3:
        return ItemType.idiom;
    }
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
          body: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
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
                          fontSize: 18, color: Colors.grey.withOpacity(.7)),
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
                      if (value != '') {
                        BlocProvider.of<SearchBloc>(context)
                            .add(SearchScreenFocus(value, getItemType()));
                        setState(() {
                          isSearchFocus = true;
                        });
                      } else {
                        setState(() {
                          isSearchFocus = false;
                        });
                      }
                    }),
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
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(.3),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelColor: Colors.black,
                            controller: tabController,
                            tabs: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Tab(
                                  icon: Image.asset('assets/quotes_icon.png'),
                                  text: 'Quotes',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Tab(
                                  icon: Image.asset('assets/phrases_icon.png'),
                                  text: 'Phrases',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Tab(
                                  icon: Image.asset('assets/idoms_icon.png'),
                                  text: 'Idioms',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              isSearchFocus && getItemType() == ItemType.quote
                                  ? const SearchSCreen()
                                  : const QuotesScreen(),
                              const Text("Malik"),
                              const Text("Malik")
                            ],
                          ),
                        ),
                      ],
                    )))
          ])),
    );
  }
}
