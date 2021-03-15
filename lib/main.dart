import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_object_example/page/same_reference_page.dart';
import 'package:key_object_example/page/same_values_page.dart';
import 'package:key_object_example/page/value_key_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Object Key';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    final style = TextStyle(color: Colors.white);

    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.clear),
          title: Text('Value Key', style: style),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          title: Text('Same Values', style: style),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.clear),
          title: Text('Same Reference', style: style),
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return ValueKeyPage();
      case 1:
        return SameValuesPage();
      case 2:
        return SameReferencePage();
      default:
        return Container();
    }
  }
}
