import 'dart:math' as math;

abstract class RandomDataUtils {
  const RandomDataUtils._();

  static final _rnd = math.Random();

  static double randomDoubleFromRange(int min, int max) => randomIntFromRange(min, max - 1) + _rnd.nextDouble();

  static int randomIntFromRange(int min, int max) => min + _rnd.nextInt(math.max(max - min, 1));
}
