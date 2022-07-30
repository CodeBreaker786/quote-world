 
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:quoteworld/models/dashboard.dart';
import 'package:quoteworld/widgets/appbar_tiltle.dart';
import '../../utils/navigation_style.dart';
import 'quotes_scraper.dart';
import '../../utils/no_internet_screen.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ImageSlider());
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 40,
                    child: Image.asset('assets/logos/splashlogo.png')),
                AppBarTitle(
                  title: "uotes",
                ),
              ],
            ),
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
                          color: Colors.green,
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
                            color: Colors.amber.shade100,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.red, Colors.orange]),
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
//
  }
}
