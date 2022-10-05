import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quoteworld/screens/quotes/bloc/quotes_bloc.dart';
import 'package:quoteworld/screens/quotes/widgets/categories_item_list.dart';
import 'package:quoteworld/screens/quotes/quote_list_screen.dart';
import 'package:quoteworld/utils/admob.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    // BannerAd(
    //   adUnitId: AdManager.bannerAdUnitId,
    //   request: const AdRequest(),
    //   size: AdSize.banner,
    //   listener: BannerAdListener(
    //     onAdLoaded: (ad) {
    //       setState(() {
    //         _bannerAd = ad as BannerAd;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, err) {
    //       print('Failed to load a banner ad: ${err.message}');
    //       ad.dispose();
    //     },
    //   ),
    // ).load();
    _loadInterstitialAd();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _loadInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AdManager.rewardedAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) async {
              await ad.dispose();
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        itemCount: categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: .85),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              BlocProvider.of<QuotesBloc>(context).add(ResetQuotesEvent());
              _loadInterstitialAd();
              _interstitialAd!.show();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuotesListScreen(
                      category: categoryList[index],
                    ),
                  ));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [
                          colors[index % 10].withOpacity(.6),
                          colors[index % 10].withOpacity(.2)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp)),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          categoryList[index].category_Name!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Align(
                          child: Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: colors[index % 10],
                                width: 5.0,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.elliptical(
                                  120,
                                  150,
                                ),
                              ),
                            ),
                            child: Image.asset(
                                "assets/quotes_categories/${categoryList[index].img_link!}"),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
