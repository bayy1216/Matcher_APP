import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../common/const/data.dart';
import '../../common/const/text_style.dart';
import '../../common/layout/default_layout.dart';
import '../model/package.dart';
import 'open_source_screen.dart';

class SettingScreen extends StatelessWidget {
  static String get routeName => 'setting';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('앱 정보', style: TITLE_LARGE1_STYLE),
              const SizedBox(height: 10),
              SettingBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingBox extends StatelessWidget {
  const SettingBox({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: DEFAULT_PADDING_H,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              if(snapshot.hasError){
                return CircularProgressIndicator();
              }
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 6),
                width: double.infinity,
                color: Colors.transparent,
                child: Text('앱버전 - ${snapshot.data!.version}', style: TITLE_SAMLL_STYLE),
              );
            },
          ),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              color: Colors.transparent,
              child: Text('개인정보 처리방침', style: TITLE_SAMLL_STYLE),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.goNamed(OpensourceScreen.routeName);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              width: double.infinity,
              color: Colors.transparent,
              child: Text('오픈소스 라이선스', style: TITLE_SAMLL_STYLE),
            ),
          ),
        ],
      ),
    );
  }
}

