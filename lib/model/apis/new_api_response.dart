class NewAPIResponse {
  String? status;
  dynamic? data;
  String? message;
  bool isSuccess = false;

  NewAPIResponse({
    required this.status,
    required this.data,
    required this.message,
  }) {
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
      );
    } catch (e) {
      print(e);
      return NewAPIResponse(status: "dd", data: null, message: "sdvsd");
    }
  }
}
