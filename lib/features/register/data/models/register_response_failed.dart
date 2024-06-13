class RegisterResponseError {
  String? message;
  Data? data;
  bool? status;
  int? code;

  RegisterResponseError({this.message, this.data, this.status, this.code});

  RegisterResponseError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  List<String>? email;
  List<String>? phone;

  Data({this.email, this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'].cast<String>();
    phone = json['phone'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}