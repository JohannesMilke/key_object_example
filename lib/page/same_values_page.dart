import 'package:flutter/material.dart';
import 'package:key_object_example/main.dart';
import 'package:key_object_example/model/user.dart';
import 'package:key_object_example/widget/user_widget.dart';

class SameValuesPage extends StatefulWidget {
  @override
  _SameValuesPageState createState() => _SameValuesPageState();
}

class _SameValuesPageState extends State<SameValuesPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    final peter1 = User(
      name: 'Peter Drucker',
      country: 'USA',
    );

    final peter2 = User(
      name: 'Peter Drucker',
      country: 'USA',
    );

    users = [
      peter1,
      peter2,
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
                      key: ObjectKey(user),
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
