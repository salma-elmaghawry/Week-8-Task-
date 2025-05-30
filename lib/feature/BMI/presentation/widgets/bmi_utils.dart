class BmiUtils {
  static String getBmiCategoryDefinition(String category, int age) {
    if (age < 18) {
      switch (category) {
        case 'Underweight (for age)':
          return 'For children and teens, BMI is age and sex-specific. Underweight means BMI is below the 5th percentile for age and sex.';
        case 'Normal (for age)':
          return 'For children and teens, a normal BMI is between the 5th and 85th percentile for age and sex.';
        case 'Overweight (for age)':
          return 'For children and teens, overweight means BMI is between the 85th and 95th percentile for age and sex.';
        case 'Obese (for age)':
          return 'For children and teens, obesity means BMI is at or above the 95th percentile for age and sex.';
        default:
          return '';
      }
    } else {
      switch (category) {
        case 'Underweight':
          return 'Being underweight means having less body fat than is considered healthy. A BMI below 18.5 is considered underweight for adults.';
        case 'Normal':
          return 'A normal weight means your BMI is between 18.5 and 24.9, which is considered healthy for most adults.';
        case 'Overweight':
          return 'Being overweight means having more body fat than is considered healthy. A BMI between 25 and 29.9 is considered overweight for adults.';
        case 'Obese':
          return 'Obesity is defined as having excess body fat. A BMI of 30 or higher is considered obese for adults.';
        default:
          return '';
      }
    }
  }
}