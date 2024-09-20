import 'package:auto_route/auto_route.dart';

class Category {
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final PageRouteInfo routePage;
  final bool isUnderDevelopment;

  const Category({
    required this.title,
    required this.subtitle,
    required this.thumbnailUrl,
    required this.routePage,
    this.isUnderDevelopment = false,
  });
}
