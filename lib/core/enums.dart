enum Relation {
  self("Self", "Self"),
  spouse("Spouse", "Family"),
  son("Son", "Family"),
  daughter("Daughter", "Family"),
  father("Father", "Family"),
  mother("Mother", "Family"),
  brother("Brother", "Family"),
  sister("Sister", "Family"),
  grandfather("Grandfather", "Family"),
  grandmother("Grandmother", "Family"),
  grandaunt("Grandaunt", "Family"),
  granduncle("Granduncle", "Family"),
  grandson("Grandson", "Family"),
  granddaughter("Granddaughter", "Family"),
  uncle("Uncle", "Family"),
  aunt("Aunt", "Family"),
  cousin("Cousin", "Family"),
  nephew("Nephew", "Family"),
  niece("Niece", "Family");

  final String value;
  final String relation;

  const Relation(this.value, this.relation);
  @override
  toString() => value;
}
