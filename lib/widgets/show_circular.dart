import 'package:flutter/material.dart';

class ShowCircular extends StatelessWidget {
  final String path;
  const ShowCircular({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(path),
    );
  }
}
