import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommentPage extends StatefulWidget {
  final String title;
  final String url;
  final String type;

  const CommentPage({
    Key? key,
    required this.title,
    required this.url,
    required this.type,
  }) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.type)),
      body: Column(
        children: [
          Text(widget.title),
          Text(
            widget.url,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
