enum Gender {
  male("Male", "M"),
  female("Female", "F"),
  other("Other", "O");

  const Gender(this.value, this.type);

  final String value;
  final String type;
  @override
  String toString() {
    return value;
  }
}

enum SegButton {
  all("All", 1),
  opd("OPD", 2),
  ipd("IPD", 3);

  const SegButton(this.value, this.type);

  final String value;
  final int type;
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
