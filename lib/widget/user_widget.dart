import 'dart:math';

import 'package:flutter/material.dart';
import 'package:key_object_example/model/user.dart';

class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();

    color = generateColor();
  }

  Color generateColor() {
    final random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.country),
          trailing: Text('HashCode: ${widget.user.hashCode}'),
        ),
      );
}
