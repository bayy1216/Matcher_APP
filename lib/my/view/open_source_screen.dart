import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/opensource_item.dart';
import '../../common/layout/default_layout.dart';
import '../model/package.dart';

class OpensourceScreen extends StatefulWidget {
  static String get routeName => 'opensource';

  const OpensourceScreen({super.key});

  @override
  State<OpensourceScreen> createState() => _OpensourceScreenState();
}

class _OpensourceScreenState extends State<OpensourceScreen> {
  List<Package> packageList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  Future<String> getJsonString(String filePath) async {
    return await rootBundle.loadString('assets/$filePath');
  }

  T _tryConverting<T>(Map<String,dynamic> json) {
    switch (T) {
      case Package:
        return Package.fromJson(json) as T;
      default:
        print('Please check _tryConverting method');
        throw Exception("Please check _tryConverting method");
    }
  }

  Future<List<T>> getObjectList<T>(String filePath) async {
    final string = await getJsonString(filePath);
    final json = jsonDecode(string);
    if (json is List) {
      return json.map<T>((e) => _tryConverting(e as Map<String, dynamic>)).toList();
    }
    return [];
  }

  void initData() async {
    final list = await getObjectList<Package>("json/licenses.json");
    setState(() {
      packageList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'opensource',
      elevation: 2,
      body: ListView.separated(
        itemBuilder: (context, index) => OpensourceItem(packageList[index]),
        itemCount: packageList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );

  }
}
