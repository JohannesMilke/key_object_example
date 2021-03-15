import 'package:flutter/material.dart';
import 'package:key_object_example/main.dart';
import 'package:key_object_example/model/user.dart';
import 'package:key_object_example/widget/user_widget.dart';

class SameReferencePage extends StatefulWidget {
  @override
  _SameReferencePageState createState() => _SameReferencePageState();
}

class _SameReferencePageState extends State<SameReferencePage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    final peter = User(
      name: 'Peter Drucker',
      country: 'USA',
    );

    users = [
      peter,
      // peter, // not working same references
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
