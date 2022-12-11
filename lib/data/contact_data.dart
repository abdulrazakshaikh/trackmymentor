class ContactData {
  String? id;
  String? conversation_id;
  String? email;
  String? image;
  String? fullname;
  String? lastmsg;

  ContactData({
    this.id,
    this.conversation_id,
    this.email,
    this.fullname,
    this.lastmsg,
    this.image,
  });

  ContactData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conversation_id = json['conversation_id'];
    email = json['email'];
    fullname = json['name'];
    image = json['image'];
    lastmsg = json['lastmsg'];
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
