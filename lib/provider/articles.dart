import 'package:fluent_ui/fluent_ui.dart';

enum ArticleCategory {
  Workout,
  Nutrition,
}

class Article {
  String id;
  String title;
  String image;
  String reference;
  ArticleCategory articleCategory;
  DateTime dateTime;
  int? likeCount;
  int? readTime;
  String? description;

  Article({
    required this.id,
    required this.title,
    required this.image,
    required this.reference,
    required this.articleCategory,
    required this.dateTime,
    this.likeCount,
    this.readTime,
    this.description,
  });
}

class Articles with ChangeNotifier {
  List<Article> _items = [
    Article(
      id: '1',
      title: 'WHAT IS COOLDOWN',
      image: 'assets/images/What-is-Cooldown.jpg',
      reference: 'HexFit',
      articleCategory: ArticleCategory.Workout,
      dateTime: DateTime.now(),
      likeCount: 23,
      readTime: 6,
      description: 'dasdmalkmvmlskmdasldmalmkmlmalvanvdadjelanfla',
    ),
    Article(
      id: '2',
      title: 'WHAT SHOULD YOU DO RIGHT AFTER A WORKOUT?',
      image: 'assets/images/What-Should-You-Do-Right-After-A-Workout.jpg',
      reference: 'HexFit',
      articleCategory: ArticleCategory.Workout,
      dateTime: DateTime.now(),
      likeCount: 51,
      readTime: 5,
      description: 'dasdmalkmvmlskmdasldmalmkmlmalvanvdadjelanfla',
    ),
    Article(
      id: '3',
      title: 'WHAT IS AFTERBURN TRAINING?',
      image: 'assets/images/afterburn-effect.png',
      reference: 'HexFit',
      articleCategory: ArticleCategory.Workout,
      dateTime: DateTime.now(),
      likeCount: 35,
      readTime: 7,
      description: 'dasdmalkmvmlskmdasldmalmkmlmalvanvdadjelanfla',
    ),
    Article(
      id: '4',
      title: 'TOP 12 HEALTHY VEGETABLES',
      image: 'assets/images/Healthy-vegetables.png',
      reference: 'HexFit',
      articleCategory: ArticleCategory.Nutrition,
      dateTime: DateTime.now(),
      likeCount: 21,
      readTime: 8,
      description: 'dasdmalkmvmlskmdasldmalmkmlmalvanvdadjelanfla',
    ),
    Article(
      id: '5',
      title: 'TOP 11 MYTHS ABOUT SUPPLEMENTS',
      image: 'assets/images/Myths-About-Supplements.png',
      reference: 'HexFit',
      articleCategory: ArticleCategory.Nutrition,
      dateTime: DateTime.now(),
      likeCount: 14,
      readTime: 12,
      description: 'dasdmalkmvmlskmdasldmalmkmlmalvanvdadjelanfla',
    ),
    Article(
      id: '6',
      title: 'WHAT SHOULD YOU DO RIGHT AFTER A WORKOUT?',
      image: 'assets/images/What-Should-You-Do-Right-After-A-Workout.jpg',
      reference: 'HexFit',
      articleCategory: ArticleCategory.Workout,
      dateTime: DateTime.now(),
      likeCount: 51,
      readTime: 5,
      description: 'dasdmalkmvmlskmdasldmalmkmlmalvanvdadjelanfla',
    ),
  ];

  List<Article> get items {
    return [..._items];
  }

  Article findById(String id){
    final article = _items.firstWhere((article) => article.id == id);
    return article;
  }
}
