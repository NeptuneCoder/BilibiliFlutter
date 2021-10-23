import 'package:flutter/material.dart';

PreferredSizeWidget? createAppbar(String title) {
  return AppBar(
    elevation: 1,
    title: Text(title),
  );
}
