class Genders {
  Genders({
    this.woman = "woman",
    this.man = "man",
    this.nonBinary = "non-binary",
    this.other = "other",
    this.preferNotToSay = "prefer_not_to_say",
  });

  final String woman;
  final String man;
  final String nonBinary;
  final String other;
  final String preferNotToSay;

  Map<String, dynamic> toJson() => {
        "woman": woman,
        "man": man,
        "non-binary": nonBinary,
        "other": other,
        "prefer_not_to_say": preferNotToSay,
      };
}
