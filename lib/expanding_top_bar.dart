import 'package:flutter/material.dart';

class ExpandingTopBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanding top bar'),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
              _buildRow(),
            ],
          ),
          ExpandingTopBar(),
        ],
      ),
    );
  }

  _buildRow() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Card(
          child: Container(
            height: 100,
          ),
        )),
        Expanded(
            child: Card(
          child: Container(
            height: 100,
          ),
        ))
      ],
    );
  }
}

class ExpandingTopBar extends StatefulWidget {
  @override
  _ExpandingTopBarState createState() => _ExpandingTopBarState();
}

class _ExpandingTopBarState extends State<ExpandingTopBar> {
  double height = 500;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          if (height + details.delta.dy < 200) {
            height = 200;
          } else {
            height += details.delta.dy;
          }
        });
      },
      child: Material(
        elevation: 8.0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 10),
          height: height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.yellow,
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
