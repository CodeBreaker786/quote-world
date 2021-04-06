import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quoteworld/screens/idioms/idioms.dart';
import 'package:quoteworld/screens/last_words/last_words.dart';
import 'package:quoteworld/screens/phrase/phrase_dashboard.dart';
import 'package:quoteworld/screens/tabbar_screen.dart';

import 'quotes/dashboard.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }
  // List<Widget> screens = [HomeScreen(), Details(), Profile(), AuthPage()];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  void onTap(index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    //bool offset = Provider.of<NavigationBarModel>(context).navigationBar;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,

        items: [
          Container(
              height: 25,
              child: Image.asset(
                'assets/logos/splashlogo.png',
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              )),
          Container(
              height: 25,
              child: Image.asset(
                'assets/phrase.png',
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              )),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'i',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Myfont',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'l',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Myfont',
              ),
            ),
          ),
          Icon(Icons.system_update),
          // Icon(Icons.phonelink_erase),
          // Icon(Icons.person_pin),
        ],
        backgroundColor: Colors.amber,
        buttonBackgroundColor: Colors.white,
        color: Colors.white60,
        index: pageIndex,

        // color: Colors.transparent,
        onTap: onTap,
        // backgroundColor: Theme.of(context).accentColor,
      ),
      body: PageView(
        children: <Widget>[
          DashBoard(),
          PhraseScraper(),
          IdiomsScraper(),
          LastWordsScraper(),
          TabBarForCollection()

          //  PhraseScraper(),
          // WebScraperScreen(
          //   url: 'https://www.goodreads.com/quotes/tag/love?page=',
          //   title: "Love Quotes",
          // )
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
