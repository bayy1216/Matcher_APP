import 'package:flutter/material.dart';

import '../../common/layout/default_layout.dart';

class MessageScreen extends StatefulWidget {
  static String get routeName => 'message';

  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            isScrollable: true,
            controller: _controller,
            tabs: [
              renderTab('알림'),
              renderTab('쪽지함'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Center(child: Text('알림')),
                Center(child: Text('쪽지함')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderTab(String title) {
    return SizedBox(
      width: 70,
      height: 30,
      child: Center(
        child: Text(title),
      ),
    );
  }
}