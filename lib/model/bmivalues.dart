import 'dart:math';
//function which returns the BMI of the given height and weight
double bmi(int h, int w) {
  return w/pow((h*0.01),2);
}
//function which returns the class of the given BMI
String classes(double bmi) {
  if (bmi < 19)
    return 'Low BMI';
  else if (bmi >= 19 && bmi <= 24)
    return 'Normal';
  else if (bmi > 24 && bmi <= 29)
    return 'Overweight';
  else if (bmi > 30 && bmi <= 39)
    return 'Obesity';
  else if (bmi > 40) return 'Severe obesity';
}