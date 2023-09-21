import 'package:flutter/material.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';

class JobDetailScreen extends StatelessWidget {
  static String get routeName => 'job_detail';
  const JobDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      body: ListView(
        children: [
          _Writer(
            writer: '홍길동',
            date: '2023-09-15 21:00',
            imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q='
                'tbn:ANd9GcSK10NckXTTzmLQxJu6maCL_Z5SUTphEUjGvw&usqp=CAU',
            major: '컴퓨터학부',
            studentNumber: 19,
          ),
          const SizedBox(height: 10),
          _Content(
            title: '종프 팀원 하실분을 찾습니다.',
            content: '화요일 5시 수업 성실하신분\n열심히 해서 A 받으실분 연락주세요',
          ),
          const SizedBox(height: 30),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q='
                'tbn:ANd9GcSK10NckXTTzmLQxJu6maCL_Z5SUTphEUjGvw&usqp=CAU',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

class _Writer extends StatelessWidget {
  final String writer;
  final String date;
  final String imgUrl;
  final String major;
  final int studentNumber;
  const _Writer({
    super.key,
    required this.writer,
    required this.date,
    required this.imgUrl,
    required this.major,
    required this.studentNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H,),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              imgUrl,
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(writer, style: TITLE_MEDIUMN_STYLE,),
                    const SizedBox(width: 10,),
                    Text(DataUtils.majorAndStudentNumber(major, studentNumber), style: CONTENT_SMALL_STYLE,),
                  ],
                ),
                Text(date, style: CONTENT_SMALL_STYLE,),
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String content;
  const _Content({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TITLE_MEDIUMN_STYLE,),
          const SizedBox(height: 10),
          Text(content, style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}

