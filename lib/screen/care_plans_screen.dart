import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/articles.dart';
import '../widgets/article_item.dart';

class CarePlansScreen extends StatelessWidget {
  const CarePlansScreen({Key? key}) : super(key: key);

  static const routeName = '/Profile Screen --> Care plans Screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final articleData = Provider.of<Articles>(context).items;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: (size.height) /14,
          width: size.width,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            left: 35,
            right: 35,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Care Plans',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: articleData.length,
              itemBuilder: (ctx, i) => ArticleItem(
                id: articleData[i].id,
                title: articleData[i].title,
                image: articleData[i].image,
                articleCategory: articleData[i].articleCategory,
                dateTime: articleData[i].dateTime.toString(),
                reference: articleData[i].reference,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
