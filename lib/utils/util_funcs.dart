import 'dart:math';

int generateRandomInt({int start = 0, int end = 255}) {
  int r = Random().nextInt(end - start + 1);
  return start + r;
}
