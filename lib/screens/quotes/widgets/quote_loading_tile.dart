import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuoteLoadingTile extends StatelessWidget {
  const QuoteLoadingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0).copyWith(bottom: 12),
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
            height: MediaQuery.of(context).size.height * .05,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: MediaQuery.of(context).size.height * .17,
              width: MediaQuery.of(context).size.width * .35,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 4.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .1),
              child: Container(
                height: 25,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .2),
              child: Container(
                height: 25,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .015,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .12),
              child: Container(
                height: 25,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
