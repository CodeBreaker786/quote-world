import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quoteworld/blocs/search_bloc/search_bloc.dart';
import 'package:quoteworld/screens/quotes/widgets/quote_detail_screen.dart';
import 'package:quoteworld/screens/quotes/widgets/quote_tile.dart';

import '../../utils/admob.dart';
import '../quotes/widgets/categories_item_list.dart';

class SearchSCreen extends StatefulWidget {
  const SearchSCreen({Key? key}) : super(key: key);

  @override
  State<SearchSCreen> createState() => _SearchSCreenState();
}

class _SearchSCreenState extends State<SearchSCreen> {
  InterstitialAd? _interstitialAd;

  _loadInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: AdManager.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdImpression: ((ad) => ad.dispose()),
            onAdClicked: (ad) => ad.dispose(),
            onAdShowedFullScreenContent: ((ad) => ad.dispose()),
            onAdWillDismissFullScreenContent: (ad) async {
              await ad.dispose();
            },
            onAdDismissedFullScreenContent: (ad) async {
              await ad.dispose();
            },
          );

          _interstitialAd = ad;
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    _loadInterstitialAd();
    super.initState();
  }

  @override
  void dispose()  {
   if(_interstitialAd!=null){
        _interstitialAd!.dispose();
    }
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is SearchLoadingInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is SearchItemLoaded) {
        return ListView.builder(
          itemCount: state.items.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () async {
                  await _loadInterstitialAd();
                  if (_interstitialAd != null) {
                    _interstitialAd!.show();
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuoteDetail(
                                item: state.items[index],
                                appBarTitle: state.keyWord,
                              )));
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(.1),
                          blurRadius: 2,
                          offset: Offset.zero),
                    ],
                    borderRadius: BorderRadius.circular(18),
                    color: colors[index % 10].withOpacity(.15),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .15,
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 72,
                            width: 64,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.3),
                                borderRadius: BorderRadius.circular(12)),
                            child: state.items[index].imageUrl != null
                                ? Image.network(
                                    state.items[index].imageUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : const Center(
                                    child: Icon(
                                      Icons.perm_identity_sharp,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.items[index].quoteWriter,
                                  style: GoogleFonts.fredokaOne(fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    state.items[index].content!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }
      return Container();
    });
  }
}
