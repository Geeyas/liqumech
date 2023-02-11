import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double? getLastIntegers(
  String textToExtractFrom,
  int numberOfInteger,
) {
  String finalResult = textToExtractFrom.substring(
      numberOfInteger, textToExtractFrom.length - 4);
  double finalResultAsInteger = double.parse(finalResult);
  return finalResultAsInteger;
}
