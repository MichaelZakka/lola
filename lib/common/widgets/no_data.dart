import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NoData extends StatelessWidget {
  final String text;
  const NoData({super.key, this.text = "noData"});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text.tr));
  }
}
