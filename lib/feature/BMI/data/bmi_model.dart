class BmiModel {
  final double height;
  final double weight;
  final bool isMale;
  final int age;

  BmiModel({
    required this.height,
    required this.weight,
    required this.isMale,
    required this.age,
  });

  double calculateBmi() {
    return weight / ((height / 100) * (height / 100));
  }

  String getBmiCategory() {
    final bmi = calculateBmi();
    
    if (age < 18) {
      if (bmi < 5) return 'Underweight (for age)';
      if (bmi >= 5 && bmi < 85) return 'Normal (for age)';
      if (bmi >= 85 && bmi < 95) return 'Overweight (for age)';
      return 'Obese (for age)';
    } else {
      if (bmi < 18.5) return 'Underweight';
      if (bmi >= 18.5 && bmi < 25) return 'Normal';
      if (bmi >= 25 && bmi < 30) return 'Overweight';
      return 'Obese';
    }
  }

  String getBmiDescription() {
    final category = getBmiCategory();
    if (age < 18) {
      switch (category) {
        case 'Underweight (for age)':
          return 'Your BMI result indicates that you\'re underweight for your age. Consult a pediatrician for guidance.';
        case 'Normal (for age)':
          return 'Your BMI result indicates a healthy weight for your age.';
        case 'Overweight (for age)':
          return 'Your BMI result indicates you\'re overweight for your age. Focus on healthy eating and physical activity.';
        case 'Obese (for age)':
          return 'Your BMI result indicates obesity for your age. Consult a healthcare provider.';
        default:
          return '';
      }
    } else {
      switch (category) {
        case 'Underweight':
          return 'Your BMI result indicates that you\'re underweight. Consider consulting a nutritionist.';
        case 'Normal':
          return 'Your BMI result indicates that you have a healthy weight. Keep it up!';
        case 'Overweight':
          return 'Your BMI result indicates that you\'re overweight. Try a healthy diet and regular exercise.';
        case 'Obese':
          return 'Your BMI result indicates obesity. Consult a healthcare provider.';
        default:
          return '';
      }
    }
  }

  List<String> getHealthRisks() {
    final category = getBmiCategory();
    if (age < 18) {
      switch (category) {
        case 'Underweight (for age)':
          return [
            'Growth and development issues',
            'Nutritional deficiencies',
            'Weakened immune system'
          ];
        case 'Overweight (for age)':
          return [
            'Early onset of type 2 diabetes',
            'High blood pressure',
            'Joint problems',
            'Low self-esteem'
          ];
        case 'Obese (for age)':
          return [
            'Severe risk of type 2 diabetes',
            'Heart disease risk factors',
            'Sleep apnea',
            'Social isolation'
          ];
        default:
          return [];
      }
    } else {
      switch (category) {
        case 'Underweight':
          return [
            'Nutritional deficiencies',
            'Osteoporosis',
            'Decreased immune function',
            'Fertility problems'
          ];
        case 'Overweight':
          return [
            'High blood pressure',
            'Heart disease',
            'Type 2 diabetes',
            'Joint pain',
            'Sleep disorders'
          ];
        case 'Obese':
          return [
            'Severe heart disease',
            'Type 2 diabetes',
            'Certain cancers',
            'Sleep apnea',
            'Stroke'
          ];
        default:
          return [];
      }
    }
  }
}