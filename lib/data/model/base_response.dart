class BaseResponse<T>{
  T data;
  int errorCode;
  String errorMsg;

  BaseResponse.fromJson(Map<String,dynamic> json)
      : data = json["data"],
        errorCode = json["errorCode"],
        errorMsg = json["errorMsg"];

  @override
  String toString() {
    return "data:$data , errorCode:$errorCode, errorMsg:$errorMsg";
  }
}