class LoginResponseError {
  String? message;
  dynamic data;
  bool? status;
  int? code;

  LoginResponseError({this.message, this.data, this.status, this.code});

  LoginResponseError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}