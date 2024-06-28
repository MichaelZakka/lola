import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnTextWidget extends StatelessWidget {
  final String image;
  final String text;
  ColumnTextWidget({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(text)
      ],
    );
  }
}
