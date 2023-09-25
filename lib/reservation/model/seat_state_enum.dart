import 'package:flutter/material.dart';

enum SeatState{
  available(Color(0xFFe8e8e8)),
  reserved(Color(0xFF393939)),
  banned(Colors.black);
  final Color color;
  const SeatState(this.color);
}