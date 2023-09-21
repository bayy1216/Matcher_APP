import 'package:flutter/material.dart';

import '../const/text_style.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  final String? title;
  final Widget? titleWidget;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final double elevation;
  const DefaultLayout({
    required this.body,
    this.backgroundColor,
    this.title,
    this.titleWidget,
    this.actions,
    this.bottomNavigationBar,
    this.elevation = 0,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        appBar: renderAppBar(),
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }

  AppBar? renderAppBar(){
    if(title == null){
      return null;
    }

    return AppBar(
      backgroundColor: Colors.white,
      elevation: elevation,
      scrolledUnderElevation: 0,
      title: titleWidget ?? Text(
        title!,
        style: TITLE_MEDIUMN_STYLE,
      ),
      centerTitle: false,
      foregroundColor: Colors.black,
      actions: actions,
    );
  }
}