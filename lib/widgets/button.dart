import 'package:flutter/material.dart';
import '../utils/constants.dart';

ButtonStyle styleButtonApp = ButtonStyle(
  fixedSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
  backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(17.0),
    ),
  ),
);