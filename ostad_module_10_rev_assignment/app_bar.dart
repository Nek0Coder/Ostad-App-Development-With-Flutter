import 'package:flutter/material.dart';

dynamic appBar() {
  return AppBar(
    backgroundColor: Colors.blueGrey,
    shape: RoundedRectangleBorder(),

    title: Center(
      child: Text(
        "Contact List",
        style: TextStyle(color: Colors.white, fontWeight: .bold),
      ),
    ),
  );
}
