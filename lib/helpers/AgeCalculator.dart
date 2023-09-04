class AgeCalculator {
  static int calculateAge(DateTime? birthDate) {
    print(birthDate);
    if (birthDate == null) return 0;

    final now = DateTime.now();

    int age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  static DateTime calculateAgeInverse(String? age) {
    if (age == null) return DateTime.now();
    final parsed = int.tryParse(age);
    if (parsed == null) return DateTime.now();
    return DateTime(DateTime.now().year - parsed);
  }
}
