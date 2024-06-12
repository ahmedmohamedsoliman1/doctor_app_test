class LoginRequest {
  String? email ;
  String? password ;

  LoginRequest ({this.password , this.email}) ;

  LoginRequest.fromJson (Map<String , dynamic> json ) {
    email = json["email"] ;
    password = json["password"] ;
  }


  Map<String , dynamic> toJson () {
    return {
      "email" : email ,
      "password" : password
    };
  }

}