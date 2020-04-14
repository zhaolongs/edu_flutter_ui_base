

class CommonResponse{
  int code;
  dynamic data;
  String message;

  static CommonResponse fromJson(Map<dynamic,dynamic> json){
    CommonResponse commonResponse = new CommonResponse();

    commonResponse.code = json["code"];

    commonResponse.message = json["message"];

    commonResponse.data = json["data"];

    return commonResponse;

  }

}