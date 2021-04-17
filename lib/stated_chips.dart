import 'package:flutter/material.dart';

/// https://www.uplabs.com/posts/find-homes-apartments-and-hostel-for-rent-mobile-app-ui-kit
class StatedChipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stated chip'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              StatedChip(
                child: Icon(Icons.home),
              ),
              StatedChip(
                child: Column(
                  children: <Widget>[Icon(Icons.local_parking), Text('Parking')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatedChip extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final Widget child;

  StatedChip({
    this.padding = const EdgeInsets.all(8.0),
    this.child,
  });

  @override
  _StatedChipState createState() => _StatedChipState();
}

class _StatedChipState extends State<StatedChip> {
  bool isSelected = false;

  void _chipTapped() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 2.0,
            color: isSelected ? Color(0xFF8FD3FE) : Color(0xFFF0F0F0),
          ),
        ),
        child: InkWell(
          onTap: _chipTapped,
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
