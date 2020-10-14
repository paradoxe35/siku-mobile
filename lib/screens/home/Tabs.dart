import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  final int index;
  final dynamic onPageChanged;
  final List tabsLabel;

  const Tabs({
    Key key,
    @required this.index,
    this.onPageChanged,
    @required this.tabsLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 24),
        ...tabsLabel
            .asMap()
            .map((key, value) => MapEntry(
                key,
                MyTab(
                  isSelected: key == index,
                  text: value,
                  index: key,
                  onTap: onPageChanged,
                )))
            .values
            .toList()
      ],
    );
  }
}

class MyTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final int index;
  final Function onTap;

  const MyTab({
    Key key,
    @required this.isSelected,
    @required this.text,
    @required this.index,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              if (onTap != null) onTap(index);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSelected ? 16 : 14,
                color: Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 6,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: isSelected ? Color(0xFF035AA6) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
