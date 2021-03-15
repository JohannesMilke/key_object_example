import 'package:flutter/material.dart';
import 'package:key_object_example/main.dart';
import 'package:key_object_example/model/user.dart';
import 'package:key_object_example/widget/user_widget.dart';

class ValueKeyPage extends StatefulWidget {
  @override
  _ValueKeyPageState createState() => _ValueKeyPageState();
}

class _ValueKeyPageState extends State<ValueKeyPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = [
      User(
        name: 'Peter Drucker',
        country: 'USA',
      ),
      User(
        name: 'Peter Drucker',
        country: 'USA',
      ),
      User(
        name: 'Sarah Abs',
        country: 'England',
      ),
      User(
        name: 'James High',
        country: 'India',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: users
                .map<Widget>((user) => UserWidget(
                      // key: ValueKey(user), // not working
                      user: user,
                    ))
                .toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.swap_horiz, size: 32),
          onPressed: swapTiles,
        ),
      );

  void swapTiles() => setState(() {
        final user = users.removeAt(0);
        users.insert(1, user);
      });
}
