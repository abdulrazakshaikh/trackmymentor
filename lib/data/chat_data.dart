class ChatData {
  String? id;
  String? sender_id;
  String? receiver_id;
  String? message;
  String? createdDate;
  String? coversation_id;

  ChatData({
    this.id,
    this.sender_id,
    this.receiver_id,
    this.message,
    this.createdDate,
    this.coversation_id,
  });

  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender_id = json['sender_id'];
    receiver_id = json['receiver_id'];
    message = json['message'];
    createdDate = json['created_date'];
  }

/*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['teacher_id'] = this.teacherId;
    data['message'] = this.message;
    data['created_date'] = this.createdDate;
    data['teacher_name'] = this.teacher_name;
    data['student_name'] = this.student_name;
    data['image'] = this.image;
    return data;
  }*/
}
