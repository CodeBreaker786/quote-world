import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/screens/quotes/bloc/quotes_bloc.dart';
import 'package:quotes_app/screens/quotes/widgets/categories_item_list.dart';
import 'package:quotes_app/screens/quotes/quote_list_screen.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
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
            onTap: () {
              BlocProvider.of<QuotesBloc>(context).add(ResetQuotesEvent());
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
