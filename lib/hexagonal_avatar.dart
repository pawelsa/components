import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

///https://www.uplabs.com/posts/find-homes-apartments-and-hostel-for-rent-mobile-app-ui-kit
class HexagonalAvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hexagonal avatar'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Container(
            height: 300,
            child: ClipPolygon(
              sides: 6,
              borderRadius: 12,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                  ),
                  Positioned(
                    bottom: -50,
                    left: 50,
                    child: Container(
                      height: 200,
                      child: ClipPolygon(
                        borderRadius: 12,
                        child: Container(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        sides: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
