import 'package:flutter/material.dart';

class ImageBox extends StatelessWidget {
  final Widget image;
  const ImageBox({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 100,
        height: 100,
        child: image,
      ),
    );
  }
}
