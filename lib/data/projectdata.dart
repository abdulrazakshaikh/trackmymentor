class ProjectData {
  String? id;
  String? email;
  String? categoryId;
  String? title;
  String? class1;
  String? subject;
  String? image;
  String? description;
  String? lastdate;
  String? createdDate;
  String? updatedDate;
  String? status;

  ProjectData(
      {this.id,
      this.email,
      this.categoryId,
      this.title,
      this.class1,
      this.subject,
      this.image,
      this.description,
      this.lastdate,
      this.createdDate,
      this.updatedDate,
      this.status});

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    email = json['email'];
    categoryId = json['category_id'];
    title = json['title'];
    class1 = json['class'];
    subject = json['subject'];
    image = json['image'];
    description = json['description'];
    lastdate = json['lastdate'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['class'] = this.class1;
    data['subject'] = this.subject;
    data['image'] = this.image;
    data['description'] = this.description;
    data['lastdate'] = this.lastdate;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['status'] = this.status;
    return data;
  }
}
