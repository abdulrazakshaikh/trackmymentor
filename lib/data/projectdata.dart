import 'package:trackmy_mentor/data/quotationdata.dart';

import 'TeacherRatingData.dart';

class ProjectData {
  String? id;
  String? email;
  String? category;
  String? category_name;
  String? title;
  String? class1;
  String? class_name;
  String? subject;
  String? subject_name;
  String? image;
  String? description;
  String? lastdate;
  String? rating;
  String? createdDate;
  String? updatedDate;
  String? status;
  TeacherRatingData? teacherRatingData;
  QuotationData? quotationData;

  ProjectData(
      {this.id,
      this.email,
      this.category,
      this.category_name,
      this.title,
      this.class1,
      this.subject,
      this.image,
      this.description,
      this.rating,
      this.lastdate,
      this.createdDate,
      this.updatedDate,
      this.status,
      this.teacherRatingData,
      this.quotationData});

  ProjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    email = json['email'];
    category = json['category'];
    category_name = json['category_name'];
    title = json['title'] ?? "Title";
    class1 = json['class'];
    class_name = json['class_name'];
    subject = json['subject'];
    subject_name = json['subject_name'];
    image = json['image'];
    description = json['description'];
    lastdate = json['lastdate'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    status = json['status'].toString();
    rating = json['rating'].toString();
    try {
      teacherRatingData = TeacherRatingData.fromJson(json['teacher_rating']);
      quotationData = QuotationData.fromJson(json['quotation']);
    } catch (e) {
      //print("eeeeeeeeee");
      //print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['category_id'] = this.category;
    data['category_name'] = this.category_name;
    data['title'] = this.title;
    data['class'] = this.class1;
    data['class_name'] = this.class_name;
    data['subject'] = this.subject;
    data['subject_name'] = this.subject_name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['lastdate'] = this.lastdate;
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['teacher_rating'] = teacherRatingData?.toJson();
    data['quotation'] = quotationData?.toJson();
    return data;
  }
}

