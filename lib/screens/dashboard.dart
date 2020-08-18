import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quoteworld/models/dashboard.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text("Category"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            semanticChildCount: 2,
            children: dashboardItem
                .map((e) => Container(
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
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(e.img_link),
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

  Widget _buildSliderCard(int index) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider('hyg'),
                      fit: BoxFit.cover)),
              child: Card(
                color: Colors.white30,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'Society Name',
                    //searchResults[index].ownerName,
                    style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
