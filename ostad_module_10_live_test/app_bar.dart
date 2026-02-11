import 'package:flutter/material.dart';

dynamic appBar(double deviceHeight) {
  return AppBar(
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(),
    toolbarHeight: deviceHeight * .05,

    title: Text(
      "Add Employe",
      style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: .bold),
    ),
  );
}
