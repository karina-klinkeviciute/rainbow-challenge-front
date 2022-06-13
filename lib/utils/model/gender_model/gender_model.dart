class Genders {
  Genders({
    this.woman = "woman",
    this.man = "man",
    this.nonBinary = "nonBinary",
    this.other = "other",
    this.preferNotToSay = "preferNotToSay",
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
