class ErrorModel {
  bool? error;
  String? message ;

  ErrorModel ({this.error = true, this.message = "Error happened"}) ;

  ErrorModel.fromJson (Map<String , dynamic> json ) {
    error= json["error"] ;
    message = json["message"] ;
  }


  Map<String , dynamic> toJson () {
    return {
      "error" : error ,
      "message" : message
    };
  }

}