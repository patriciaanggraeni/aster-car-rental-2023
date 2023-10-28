import 'package:flutter/material.dart';

class MiniDetailCarWidget extends StatelessWidget {
  const MiniDetailCarWidget({
    super.key,
    required this.attribute,
    required this.value,
  });

  final String attribute, value;

  @override
  Widget build(BuildContext context) {
    Widget textDetail({
      required String name,
      FontWeight fontWeight = FontWeight.normal,
      double width = 0,
    }) {
      return SizedBox(
        width: (width != 0) ? width : null,
        child: Text(
          name,
          style: TextStyle(
            fontWeight: fontWeight,
          ),
        ),
      );
    }

    return SizedBox(
      width: 160,
      child: Row(
        children: [
          textDetail(name: attribute, fontWeight: FontWeight.bold, width: 60),
          textDetail(name: ':', fontWeight: FontWeight.bold, width: 20),
          textDetail(name: value),
        ],
      ),
    );
  }
}
