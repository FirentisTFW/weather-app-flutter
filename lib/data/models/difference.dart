abstract class Difference {
  const Difference();
}

class SecondsDifference extends Difference {
  final int data;

  const SecondsDifference(this.data);
}

class TemperatureDifference extends Difference {
  final double data;

  const TemperatureDifference(this.data);
}
