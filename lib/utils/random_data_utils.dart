import 'dart:math';

abstract class RandomDataUtils {
  const RandomDataUtils._();

  static double randomDoubleFromRange(int min, int max) => randomIntFromRange(min, max - 1) + Random().nextDouble();

  static int randomIntFromRange(int min, int max) => min + Random().nextInt(max - min);
}
