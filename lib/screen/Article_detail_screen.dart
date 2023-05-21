import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

import '../provider/articles.dart';

class ArticleDetailScreen extends StatelessWidget {
  const ArticleDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/Care plan Screen --> Article detail Screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final articleId = ModalRoute.of(context)!.settings.arguments as String;
    final article = Provider.of<Articles>(context).findById(articleId);
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
        elevation: 0,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: size.height / 4,
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: 10, bottom: 16, left: 15, right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  article.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32,right: 32),
              child: Row(
                children: [
                  Text(
                    article.reference,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    article.articleCategory.toString().substring(16),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(5),
                  const Icon(flu.FluentIcons.hexagon,color: Colors.yellow,size:
                  16,),
                  const Gap(5),
                  const Text(
                    'DECEMBER 19, 2022',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
