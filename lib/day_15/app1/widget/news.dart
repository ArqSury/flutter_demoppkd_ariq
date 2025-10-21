import 'package:flutter/material.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    super.key,
    required this.news,
    required this.newstitle,
    required this.newsdate,
  });
  final IconData news;
  final String newstitle;
  final String newsdate;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.news),
      trailing: Icon(Icons.newspaper),
      title: Text(widget.newstitle),
      subtitle: Text(widget.newsdate),
    );
  }
}
