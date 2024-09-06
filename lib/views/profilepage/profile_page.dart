import 'dart:convert';
import 'package:crtd_assignment/views/utils/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:crtd_assignment/controllers/user_provider.dart';
import 'package:crtd_assignment/controllers/email_provider.dart';
import 'package:http/http.dart' as http;

class EditUserPage extends ConsumerStatefulWidget {
  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends ConsumerState<EditUserPage> {
  final _formKey = GlobalKey<FormState>(); // Corrected form key
  late TextEditingController fullNameController;
  late TextEditingController fatherNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController whatsappNumberController;
  late TextEditingController collegeStateController;
  late TextEditingController birthPlaceController;
  late TextEditingController collegeNameController;
  late TextEditingController branchNameController;
  late TextEditingController degreeNameController;
  late TextEditingController passwordController;
  late TextEditingController dateOfBirthController;
  late TextEditingController genderController;
  late TextEditingController paymentStatusController;
  late TextEditingController uniqueController;
  late TextEditingController timeEndController;
  late TextEditingController otpController;
  late TextEditingController passingYearController;
  late bool verified;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    fatherNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    whatsappNumberController = TextEditingController();
    collegeStateController = TextEditingController();
    birthPlaceController = TextEditingController();
    collegeNameController = TextEditingController();
    branchNameController = TextEditingController();
    degreeNameController = TextEditingController();
    passwordController = TextEditingController();
    dateOfBirthController = TextEditingController();
    genderController = TextEditingController();
    paymentStatusController = TextEditingController();
    uniqueController = TextEditingController();
    timeEndController = TextEditingController();
    otpController = TextEditingController();
    passingYearController = TextEditingController();
    verified = false;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    fatherNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    whatsappNumberController.dispose();
    collegeStateController.dispose();
    birthPlaceController.dispose();
    collegeNameController.dispose();
    branchNameController.dispose();
    degreeNameController.dispose();
    passwordController.dispose();
    dateOfBirthController.dispose();
    genderController.dispose();
    paymentStatusController.dispose();
    otpController.dispose();
    passingYearController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        dateOfBirthController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final specificEmail = ref.watch(emailprovider);
    final futureUsers = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('User Profile'),
      ),
      body: futureUsers.when(
        data: (users) {
          final filteredUsers =
              users.where((user) => user.email == specificEmail);

          if (filteredUsers.isEmpty) {
            return Center(child: Text('No user found with this email'));
          } else {
            final user = filteredUsers.first;

            fullNameController.text = user.fullName ?? '';
            fatherNameController.text = user.fatherName ?? '';

            emailController.text = user.email ?? '';
            phoneNumberController.text = user.phoneNumber ?? '';
            whatsappNumberController.text = user.whatsappNumber ?? '';
            collegeStateController.text = user.collegeState ?? '';
            birthPlaceController.text = user.birthPlace ?? '';
            collegeNameController.text = user.collegeName ?? '';
            branchNameController.text = user.branchName ?? '';
            degreeNameController.text = user.degreeName ?? '';
            passwordController.text = user.password ?? '';
            genderController.text = user.gender ?? '';
            paymentStatusController.text = user.paymentStatus ?? '';
            otpController.text = user.otp?.toString() ?? '';
            passingYearController.text = user.passingYear?.toString() ?? '';
            verified = user.verified ?? false;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey, // Corrected form key usage
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormFieldWidget(
                        controller: fullNameController,
                        label: 'Full Name',
                      ),
                      FormFieldWidget(
                        controller: emailController,
                        label: 'Email',
                      ),
                      FormFieldWidget(
                        controller: phoneNumberController,
                        label: 'Phone Number',
                      ),
                      FormFieldWidget(
                        controller: whatsappNumberController,
                        label: 'WhatsApp Number',
                      ),
                      FormFieldWidget(
                        controller: collegeStateController,
                        label: 'College State',
                      ),
                      FormFieldWidget(
                        controller: birthPlaceController,
                        label: 'Birth Place',
                      ),
                      FormFieldWidget(
                        controller: collegeNameController,
                        label: 'College Name',
                      ),
                      FormFieldWidget(
                        controller: branchNameController,
                        label: 'Branch Name',
                      ),
                      FormFieldWidget(
                        controller: degreeNameController,
                        label: 'Degree Name',
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: TextFormField(
                          controller: dateOfBirthController,
                          decoration: InputDecoration(
                              labelText: 'Date of Birth',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            FocusScope.of(context).requestFocus(
                                FocusNode()); // Prevents keyboard from showing
                            _selectDate(context); // Show date picker
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your date of birth';
                            }
                            // Optional: Add additional date format validation if needed
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: DropdownButtonFormField<String>(
                          value: genderController.text,
                          decoration: InputDecoration(
                              labelText: 'Gender',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          items: const [
                            DropdownMenuItem(
                                value: 'Male', child: Text('Male')),
                            DropdownMenuItem(
                                value: 'Female', child: Text('Female')),
                            DropdownMenuItem(
                                value: 'Other', child: Text('Other')),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              genderController.text = newValue!;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: DropdownButtonFormField<String>(
                          value: paymentStatusController.text,
                          decoration: const InputDecoration(
                              labelText: 'Payment Status',
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)))),
                          items: const [
                            DropdownMenuItem(
                                value: 'Not Enroll', child: Text('Not Enroll')),
                            DropdownMenuItem(
                                value: 'Enroll Pending',
                                child: Text('Enroll Pending')),
                            DropdownMenuItem(
                                value: 'Enrolled', child: Text('Enrolled')),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              paymentStatusController.text = newValue!;
                            });
                          },
                        ),
                      ),
                      FormFieldWidget(
                        controller: otpController,
                        label: 'OTP',
                        isDateField: false,
                        isRequired: false,
                      ),
                      FormFieldWidget(
                        controller: passingYearController,
                        label: 'Passing Year',
                        isDateField: false,
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm(context, user.id ?? 0);
                        },
                        child: Text('Update User'),
                      ),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            );
          }
        },
        error: (error, StackTrace) => Text('Error: $error'),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }

  String formatDate(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  void _submitForm(BuildContext context, int id) async {
    if (_formKey.currentState?.validate() != true) {
      return; // Form validation failed
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a valid date of birth.'),
        ),
      );
      return;
    }

    var formData = {
      'date_of_birth': formatDate(_selectedDate!), // Ensure date is non-null
      'otp': int.tryParse(otpController.text) ?? 100000,
      'full_name': fullNameController.text,
      'father_name': fatherNameController.text,
      'email': emailController.text,
      'gender': genderController.text,
      'phone_number': phoneNumberController.text,
      'whatsapp_number': whatsappNumberController.text,
      'college_state': collegeStateController.text,
      'birth_place': birthPlaceController.text,
      'college_name': collegeNameController.text,
      'branch_name': branchNameController.text,
      'degree_name': degreeNameController.text,
      'passing_year': int.tryParse(passingYearController.text),
      'password': passwordController.text,
    };

    var response = await http.put(
      Uri.parse('http://13.127.246.196:8000/api/registers/${id}/'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(formData),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User updated successfully!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${response.reasonPhrase}'),
        ),
      );
    }
  }
}
