import 'package:flutter/material.dart';

class SummaryCardBuilder extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double? fontSize;
  const SummaryCardBuilder({Key? key, this.title, this.subTitle, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("$title",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5)),
          Text("$subTitle",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize ?? 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5))
        ],
      ),
    );
  }
}
