import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

final TITLE_LARGE1_STYLE = GoogleFonts.inter(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);
final TITLE_LARGE2_STYLE = TITLE_MEDIUMN1_STYLE.copyWith(
  fontSize: 18,
);

final TITLE_MEDIUMN1_STYLE = GoogleFonts.inter(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: Colors.black,
);
final TITLE_MEDIUMN2_STYLE = TITLE_MEDIUMN1_STYLE.copyWith(
  fontSize: 18,
);
final TITLE_SAMLL_STYLE = TITLE_MEDIUMN1_STYLE.copyWith(
  fontSize: 16,
);

final CONTENT_MEDIUMN_STYLE = GoogleFonts.inter(
  fontSize: 18,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

final CONTENT_MEDIUMN2_STYLE = CONTENT_MEDIUMN_STYLE.copyWith(
  fontSize: 16,
);

final CONTENT_SMALL_STYLE = GoogleFonts.inter(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: TEXT_GREY,
);