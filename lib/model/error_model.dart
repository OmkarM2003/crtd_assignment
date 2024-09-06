import 'dart:convert'; // For jsonDecode

// Class to represent individual error details
class ErrorDetail {
  String? string;
  String? code;

  ErrorDetail({this.string, this.code});

  ErrorDetail.fromJson(Map<String, dynamic> json) {
    string = json['string'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['string'] = string;
    data['code'] = code;
    return data;
  }
}

// Class to represent the overall error response
class Autogenerated {
  Map<String, List<ErrorDetail>>? errors;

  Autogenerated({this.errors});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['error'] != null) {
      errors = {};
      var errorJson = json['error'] as String; // Get the JSON string
      var errorMap =
          jsonDecode(errorJson) as Map<String, dynamic>; // Parse it into a Map

      errorMap.forEach((key, value) {
        var errorList = (value as List<dynamic>)
            .map((e) => ErrorDetail.fromJson(e as Map<String, dynamic>))
            .toList();
        errors![key] = errorList;
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {
      data['error'] = errors!.map((key, value) => MapEntry(
            key,
            value.map((e) => e.toJson()).toList(),
          ));
    }
    return data;
  }
}
