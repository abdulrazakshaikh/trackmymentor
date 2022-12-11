class QuotationData {
  String? id;
  String? projectId;
  String? teacherId;
  String? price;
  String? image;
  String? comment;
  String? lastDate;
  String? teacher_name;

  QuotationData(
      {this.id,
      this.projectId,
      this.teacherId,
      this.price,
      this.image,
      this.comment,
      this.teacher_name,
      this.lastDate});

  QuotationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    teacherId = json['teacher_id'];
    price = json['price'];
    image = json['image'];
    comment = json['comment'];
    teacher_name = json['teacher_name'];
    lastDate = json['last_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['teacher_id'] = this.teacherId;
    data['price'] = this.price;
    data['image'] = this.image;
    data['comment'] = this.comment;
    data['last_date'] = this.lastDate;
    data['teacher_name'] = this.teacher_name;
    return data;
  }
}
