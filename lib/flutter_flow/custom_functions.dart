import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String timeConvert(int timeInMs) {
  // convert time from ms to hours minutes seconds
  int seconds = (timeInMs / 1000).truncate();
  int minutes = (seconds / 60).truncate();
  seconds = seconds % 60;
  int hours = (minutes / 60).truncate();
  minutes = minutes % 60;
  return '$hours hours, $minutes minutes, $seconds seconds';
}
