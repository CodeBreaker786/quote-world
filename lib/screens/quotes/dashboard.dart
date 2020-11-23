import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:quoteworld/models/dashboard.dart';
import 'package:quoteworld/screens/drawer.dart';

import '../../utils/navigation_style.dart';
import 'quotes_scraper.dart';
import '../../utils/no_internet_screen.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ImageSlider());
  }
}

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Row(
            children: [
              Container(
                  height: 40,
                  child: Image.asset('assets/logos/splashlogo.png')),
              Text("uotes"),
            ],
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 18),
                child: StreamBuilder<ConnectivityResult>(
                    stream: Connectivity().onConnectivityChanged,
                    builder: (context, data) {
                      if (data.data == ConnectivityResult.none) {
                        return Icon(
                          Icons.signal_wifi_off,
                          color: Colors.red,
                        );
                      } else {
                        return Icon(
                          Icons.wifi,
                          color: Colors.greenAccent,
                        );
                      }
                    }))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            semanticChildCount: 2,
            children: dashboardItem
                .map((e) => InkWell(
                      onTap: () async {
                        Connectivity().checkConnectivity().then((value) {
                          if (value == ConnectivityResult.none) {
                            Navigator.push(
                                context, FadeRoute(page: NoInternetScreen()));
                          } else {
                            Navigator.push(
                                context,
                                SizeRoute(
                                    page: WebScraperScreen(
                                  url: e.screen_link,
                                  title: e.category_Name,
                                )));
                          }
                        });
                      },
                      child: Container(
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 7,
                          ),
                          child: Card(
                            color: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  image: DecorationImage(
                                    fit: BoxFit.scaleDown,
                                    image: AssetImage(e.img_link),
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    child: Text(
                                  e.category_Name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        )
//      Container(
//        height: 238,
//        child: Center(
//          child: SpinKitWave(
//            color: Theme.of(context).primaryColor,
//          ),
//        ),
//      ),
        );

//
//            return Container(
//              child: Center(
//                child: Text(
//                  "No Image is available Yet",
//                  style: TextStyle(fontSize: 20),
//                ),
//              ),
//            );
//
//          return ListView.builder(
//              scrollDirection: Axis.horizontal,
//              itemCount: searchResults.length,
//              itemBuilder: (context, index) {
//                return _buildSliderCard(index);
//              });
  }
}
