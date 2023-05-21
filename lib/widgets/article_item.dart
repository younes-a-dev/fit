import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:workout/provider/articles.dart';

import '../screen/Article_detail_screen.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(
      {
        required this.id,
        required this.title,
      required this.image,
      required this.reference,
      required this.dateTime,
      required this.articleCategory,
      Key? key})
      : super(key: key);

  final String id;
  final String title;
  final String image;
  final String reference;
  final String dateTime;
  final ArticleCategory articleCategory;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(ArticleDetailScreen.routeName,
            arguments: id);
      },
      child: Container(
        height: size.height / 8,
        margin: const EdgeInsets.only(top: 16),
        //padding: const EdgeInsets.only(left: 20,top: 10,bottom: 10,right: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SizedBox(
              width: size.width / 3,
              height: size.height / 6 - 30,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Gap(15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reference,
                  ),
                  Text(
                    'DECEMBER 19, 2022 / ${ articleCategory.toString()
                        .substring(16)}',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
