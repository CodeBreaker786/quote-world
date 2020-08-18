import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quoteworld/screens/dashboard.dart';

import '../web_scraper_screeen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PageController pageController;
  int pageIndex = 2;

  @override
  void initState() {
    pageController = PageController(initialPage: 2);
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
          Icon(Icons.favorite_border),
          Icon(Icons.system_update),
          Icon(Icons.home_outlined),
          Icon(Icons.call_to_action),
          Icon(Icons.person_pin),
        ],
        backgroundColor: Colors.grey,
        buttonBackgroundColor: Colors.white,
        color: Colors.white60,
        index: pageIndex,

        // color: Colors.transparent,
        onTap: onTap,
        // backgroundColor: Theme.of(context).accentColor,
      ),
      body: PageView(
        children: <Widget>[
          webScraperScreen(
            url: 'https://www.goodreads.com/quotes/tag/love?page=',
            title: "Love Quotes",
          ),
          webScraperScreen(
            url: 'https://www.goodreads.com/quotes/tag/love?page=',
            title: "Love Quotes",
          ),
          DashBoard(),
          webScraperScreen(
            url: 'https://www.goodreads.com/quotes/tag/love?page=',
            title: "Love Quotes",
          ),
          webScraperScreen(
            url: 'https://www.goodreads.com/quotes/tag/love?page=',
            title: "Love Quotes",
          )
        ],
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
