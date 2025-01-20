enum Gender {
  male("Male"),
  female("Female"),
  other("Other");

  const Gender(this.value);

  final String value;
  @override
  String toString() {
    return value;
  }
}

enum BloodGroup {
  aPositive("A+"),
  aNegative("A-"),
  bPositive("B+"),
  bNegative("B-"),
  abPositive("AB+"),
  abNegative("AB-"),
  oPositive("O+"),
  oNegative("O-");

  const BloodGroup(this.value);

  final String value;

  @override
  String toString() {
    return value;
  }
}
