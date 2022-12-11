class NewAPIResponse {
  String? status;
  dynamic? data;
  String? message;
  bool isSuccess = false;
  dynamic completeData;

  NewAPIResponse(
      {required this.status,
      required this.data,
      required this.message,
      this.completeData}) {
    if (status == "SUCCESS" || status == "1") {
      isSuccess = true;
    } else {
      isSuccess = false;
    }
  }

  factory NewAPIResponse.fromJson(Map<String, dynamic> json) {
    try {
      return NewAPIResponse(
        status: json['status'],
        data: json['data'],
        message: json['message'],
        completeData: json,
      );
    } catch (e) {
      print("NewAPIResponse");
      print(e);
      return NewAPIResponse(status: "dd", data: null, message: "sdvsd");
    }
  }
}
