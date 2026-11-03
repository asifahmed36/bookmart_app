class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String phone;

  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'].toString(),
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
