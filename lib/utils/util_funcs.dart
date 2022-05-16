import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int generateRandomInt({int start = 0, int end = 255}) {
  int r = Random().nextInt(end - start + 1);
  return start + r;
}

void showMessageSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
