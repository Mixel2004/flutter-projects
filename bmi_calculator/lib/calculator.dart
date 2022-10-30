class Calculator {
  final int height;
  final int weight;

  Calculator({required this.height, required this.weight});

  String calculateBMI() {
    return (weight / ((height / 100) * (height / 100))).toStringAsFixed(1);
  }

  String getResult() {
    if (double.parse(calculateBMI()) < 18.5) {
      return 'Underweight';
    } else if (double.parse(calculateBMI()) < 25) {
      return 'Normal';
    } else if (double.parse(calculateBMI()) < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String getInterpretation() {
    if (double.parse(calculateBMI()) < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (double.parse(calculateBMI()) < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (double.parse(calculateBMI()) < 30) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have a very high body weight. You should see a doctor.';
    }
  }
}
