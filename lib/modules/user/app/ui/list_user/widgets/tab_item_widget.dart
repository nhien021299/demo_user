import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  final String name;
  final bool isSelected;

  const TabItemWidget({this.isSelected, this.name});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        name,
        style: isSelected
            ? TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400)
            : TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
