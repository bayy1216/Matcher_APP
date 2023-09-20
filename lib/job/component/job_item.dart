import 'package:flutter/material.dart';

import '../../common/component/image_box.dart';
import '../../common/const/data.dart';
import '../../common/const/text_style.dart';

class JobItem extends StatelessWidget {
  final String title;
  final String? imgUrl;
  final String major;
  final String studentNumber;
  final String date;

  const JobItem({
    super.key,
    required this.title,
    this.imgUrl,
    required this.major,
    required this.studentNumber,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(title,style: TITLE_MEDIUMN_STYLE,),
                Expanded(child: Text('$major $studentNumber학번',style: CONTENT_SMALL_STYLE,),),
                Text(date,style: CONTENT_SMALL_STYLE,),
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