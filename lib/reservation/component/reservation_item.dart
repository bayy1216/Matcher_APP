import 'package:flutter/material.dart';

import '../../common/component/image_box.dart';
import '../../common/const/data.dart';
import '../../common/const/text_style.dart';

class ReservationItem extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String? imgUrl;

  const ReservationItem({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: DEFAULT_WIDGET_PADDING),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TITLE_MEDIUMN_STYLE),
                Expanded(
                  child: Text(location, style: CONTENT_SMALL_STYLE),
                ),
                Text(date, style: CONTENT_SMALL_STYLE),
              ],
            ),
          ),
          if (imgUrl != null)
            ImageBox(image: Image.network(imgUrl!, fit: BoxFit.fill)),
        ],
      ),
    );
  }
}
