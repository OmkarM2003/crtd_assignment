class User {
  int? id;
  String? paymentStatus;
  String? timeEnd;
  String? unique;
  String? fullName;
  String? fatherName;
  String? email;
  String? dateOfBirth;
  String? gender;
  String? phoneNumber;
  String? whatsappNumber;
  String? collegeState;
  String? birthPlace;
  String? collegeName;
  String? branchName;
  String? degreeName;
  int? passingYear;
  String? password;
  bool? verified;
  int? otp; // Changed from Null to int?

  User({
    this.id,
    this.paymentStatus,
    this.timeEnd,
    this.unique,
    this.fullName,
    this.fatherName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.phoneNumber,
    this.whatsappNumber,
    this.collegeState,
    this.birthPlace,
    this.collegeName,
    this.branchName,
    this.degreeName,
    this.passingYear,
    this.password,
    this.verified,
    this.otp,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentStatus = json['payment_status'];
    timeEnd = json['time_end'];
    unique = json['unique'];
    fullName = json['full_name'];
    fatherName = json['father_name'];
    email = json['email'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    whatsappNumber = json['whatsapp_number'];
    collegeState = json['college_state'];
    birthPlace = json['birth_place'];
    collegeName = json['college_name'];
    branchName = json['branch_name'];
    degreeName = json['degree_name'];
    passingYear = json['passing_year'];
    password = json['password'];
    verified = json['verified'];
    otp = json['otp'] != null
        ? json['otp'] as int
        : null; // Handling nullable OTP
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payment_status'] = paymentStatus;
    data['time_end'] = timeEnd;
    data['unique'] = unique;
    data['full_name'] = fullName;
    data['father_name'] = fatherName;
    data['email'] = email;
    data['date_of_birth'] = dateOfBirth;
    data['gender'] = gender;
    data['phone_number'] = phoneNumber;
    data['whatsapp_number'] = whatsappNumber;
    data['college_state'] = collegeState;
    data['birth_place'] = birthPlace;
    data['college_name'] = collegeName;
    data['branch_name'] = branchName;
    data['degree_name'] = degreeName;
    data['passing_year'] = passingYear;
    data['password'] = password;
    data['verified'] = verified;
    data['otp'] = otp;
    return data;
  }
}
