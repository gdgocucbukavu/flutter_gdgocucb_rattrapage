class ContactModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String location;
  final String company;
  final String birthday;

  bool isFavorite;

  ContactModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.company,
    required this.birthday,
    this.isFavorite = false,
  });

  String get fullName => '$firstName $lastName';
  String get initials => '${firstName[0]}${lastName[0]}'.toUpperCase();
  void changeFavoriteState() {
    isFavorite = !isFavorite;
  }
}

// ValueNotifier<ContactModel> dynamicContactModel = ValueNotifier(_value);
