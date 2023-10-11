import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../model/job_detail_model.dart';
import '../provider/job_provider.dart';

class JobDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'job_detail';
  final int id;

  const JobDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends ConsumerState<JobDetailScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(jobProvider.notifier).getDetailJob(id: widget.id);
  }
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(jobDetailProvider(widget.id));

    if(state == null) {
      return const DefaultLayout(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return DefaultLayout(
      title: '',
      body: ListView(
        children: [
          _Writer(
            writer: (state is JobDetailModel) ? state.userName : null,
            date: state.date.toString(),
            imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q='
                'tbn:ANd9GcSK10NckXTTzmLQxJu6maCL_Z5SUTphEUjGvw&usqp=CAU',
            major: state.userMajor,
            studentNumber: state.userStudentNumber,
          ),
          const SizedBox(height: 10),
          _Content(
            title: state.title,
            content: (state is JobDetailModel) ? state.content : null,
          ),
          const SizedBox(height: 30),
          Image.network(
            state.thumbnailUrl,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

class _Writer extends StatelessWidget {
  final String? writer;
  final String date;
  final String imgUrl;
  final String major;
  final int studentNumber;

  const _Writer({
    super.key,
    this.writer,
    required this.date,
    required this.imgUrl,
    required this.major,
    required this.studentNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DEFAULT_PADDING_H,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              imgUrl,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if(writer == null) skeletonLoader()
                    else
                    Text(
                      writer!,
                      style: TITLE_MEDIUMN2_STYLE,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      DataUtils.majorAndStudentNumber(major, studentNumber),
                      style: CONTENT_SMALL_STYLE,
                    ),
                  ],
                ),
                Text(
                  date,
                  style: CONTENT_SMALL_STYLE,
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.send))
        ],
      ),
    );
  }

  Widget skeletonLoader() {
    return Shimmer.fromColors(
      baseColor: Color.fromRGBO(240, 240, 240, 1),
      highlightColor: Colors.white,
      child: Container(
        //color: Colors.grey,
        child: Text(
          '익명',
          style: TITLE_MEDIUMN2_STYLE,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final String title;
  final String? content;

  const _Content({
    super.key,
    required this.title,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DEFAULT_PADDING_H,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TITLE_MEDIUMN2_STYLE,
          ),
          const SizedBox(height: 10),
          if(content ==null)
            skeletonLoader()
          else
            Text(
              content!,
              style: CONTENT_SMALL_STYLE.copyWith(color: Colors.black),
            ),
        ],
      ),
    );
  }
  Widget skeletonLoader() {
    return Shimmer.fromColors(
      baseColor: Color.fromRGBO(240, 240, 240, 1),
      highlightColor: Colors.white,
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
      ),
    );
  }
}
