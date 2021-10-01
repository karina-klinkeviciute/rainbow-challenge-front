import 'package:flutter/material.dart';

// A local image widget with some custom styling and settings.
// TO DO: research on image resolution options

class ImageLocalWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  // Border has a default value that can be changed
  final double borderRadius;

  const ImageLocalWidget(
      {Key? key,
      required this.url,
      this.width,
      this.height,
      this.borderRadius = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
