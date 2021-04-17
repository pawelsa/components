import 'package:components/expanding_top_bar.dart';
import 'package:components/hexagonal_avatar.dart';
import 'package:components/sliding_selector.dart';
import 'package:components/stated_chips.dart';
import 'package:components/top_screen_settings.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New components list'),
      ),
      body: Column(
        children: <Widget>[
          InkWell(
            onTap: _openStatedChipsPage,
            child: ListTile(
              title: Text('Stated chips'),
            ),
          ),
          InkWell(
            onTap: _openHexagonalAvatarPage,
            child: ListTile(
              title: Text('Hexagonal avatar'),
            ),
          ),
          InkWell(
            onTap: _openSlidingSelector,
            child: ListTile(
              title: Text('Sliding selector'),
            ),
          ),
          InkWell(
            onTap: _openTopScreenDialog,
            child: ListTile(
              title: Text('Top screen settings'),
            ),
          ),
          InkWell(
            onTap: _openExpandingTopBarPage,
            child: ListTile(
              title: Text('Expanding top bar'),
            ),
          ),
        ],
      ),
    );
  }

  void _openStatedChipsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => StatedChipsPage()),
    );
  }

  void _openHexagonalAvatarPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => HexagonalAvatarPage()),
    );
  }

  void _openSlidingSelector() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SlidingSelectorPage()),
    );
  }

  void _openTopScreenDialog() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TopScreenSettingsPage()),
    );
  }

  void _openExpandingTopBarPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ExpandingTopBarPage(),
      ),
    );
  }
}
