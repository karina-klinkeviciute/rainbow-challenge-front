import 'package:flutter/material.dart';

// An external image widget with some custom styling and settings.
// TO DO: research on image resolution options

class ImageExternalWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final double borderRadius;

  const ImageExternalWidget(
      {Key key,
      @required this.url,
      this.width,
      this.height,
      this.borderRadius = 8.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
