class UserData {
  final int id;
  final int roleId;
  final String firstName;
  final String lastName;
  final String email;
  final String contactNo;

  UserData({
    required this.id,
    required this.roleId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.contactNo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      roleId: json['role_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      contactNo: json['contact_no'],
    );
  }
}
