import 'package:flutter/material.dart';

class SlidingSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Selector'),
      ),
      body: Center(
        child: Container(
          width: 400,
          child: SlidingSelector(
            height: 50,
            elements: ["S", "M", "L", "XL", "XXL"],
          ),
        ),
      ),
    );
  }
}

class SlidingSelector extends StatefulWidget {
  final double height;
  final List<String> elements;

  SlidingSelector({this.height, this.elements});

  @override
  _SlidingSelectorState createState() => _SlidingSelectorState(this.height);
}

class _SlidingSelectorState extends State<SlidingSelector>
    with SingleTickerProviderStateMixin {
  int currentlySelected = 0;
  int differenceInItems = 0;
  double selectorSize;
  Duration animationDuration;

  _SlidingSelectorState(double height) {
    selectorSize = height * 1.2;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double minWidth = widget.elements.length * 1.2 * widget.height;
        if (width < minWidth) {
          width = minWidth;
        }
        double itemWidth = width / 5;
        double startPosForSelector =
            (itemWidth - (selectorSize)) / 2 + currentlySelected * itemWidth;
        animationDuration = Duration(milliseconds: differenceInItems * 100);

        return Container(
          width: width,
          height: selectorSize,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: widget.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: animationDuration,
                top: 0,
                left: startPosForSelector,
                child: Container(
                  height: selectorSize,
                  width: selectorSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.deepOrangeAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepOrangeAccent.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2.5,
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.elements.length,
                itemBuilder: (context, index) => _buildItem(itemWidth, index),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(double width, int index) {
    String text = widget.elements[index];
    final isSelected = currentlySelected == index;
    final animationCurve =
        isSelected ? Curves.easeInQuart : Curves.easeOutQuart;
    final textStyle = Theme.of(context).textTheme.body1.copyWith(
          color: isSelected ? Colors.white : Colors.black,
        );

    return Container(
      width: width,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              differenceInItems = (currentlySelected - index).abs();
              currentlySelected = index;
            });
          },
          child: Container(
            width: widget.height,
            height: widget.height,
            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: animationDuration,
                curve: animationCurve,
                style: textStyle,
                child: Text(text),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
