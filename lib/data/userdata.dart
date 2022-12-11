import 'TeacherRatingData.dart';

class UserData {
  String? id;
  String? degree;
  String? language;
  String? courses;
  String? noofyears;
  String? category;
  String? class1;
  String? subject;
  String? image;
  String? deviceType;
  String? deviceToken;
  String? firstname;
  String? lastname;
  String? mobile;
  String? email;
  String? description;
  String? rating;
  String? password;
  String? createdDate;
  String? updatedDate;
  String? status;
  String? type;
  String? degree_name;
  String? course_name;
  String? category_name;
  String? class_name;
  String? subject_name;
  String? overallrating;
  String? student_ratingto_teacher;
  String? language_name;

  TeacherRatingData? teacherRatingData;

  UserData(
      {this.id,
      this.degree,
      this.language,
      this.courses,
      this.noofyears,
      this.category,
      this.class1,
      this.subject,
      this.description,
      this.image,
      this.deviceType,
      this.deviceToken,
      this.firstname,
      this.lastname,
      this.mobile,
      this.email,
      this.password,
      this.createdDate,
      this.updatedDate,
      this.status,
      this.degree_name,
      this.course_name,
      this.category_name,
      this.class_name,
      this.subject_name,
      this.overallrating,
      this.teacherRatingData,
      this.student_ratingto_teacher,
      this.language_name,
      this.type});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    degree = json['degree'];
    language = json['language'];
    courses = json['courses'];
    noofyears = json['noofyears'];
    category = json['category'];
    class1 = json['class'];
    subject = json['subject'];
    image = json['image'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    description = json['description'];
    rating = json['rating'].toString();
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    createdDate = json['created_date'];
    updatedDate = json['updated_date'];
    status = json['status'];
    type = json['type'].toString();
    degree_name = json['degree_name'].toString();
    course_name = json['course_name'].toString();
    category_name = json['category_name'].toString();
    class_name = json['class_name'].toString();
    subject_name = json['subject_name'].toString();
    overallrating = json['overallrating'].toString();
    student_ratingto_teacher = json['student_ratingto_teacher'].toString();
    language_name = json['language_name'].toString();
    try {
      teacherRatingData = TeacherRatingData.fromJson(json['student_rating']);
    } catch (e) {
      // print("eeeeeeeeee");
      // print(e);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['degree'] = this.degree;
    data['language'] = this.language;
    data['courses'] = this.courses;
    data['noofyears'] = this.noofyears;
    data['category'] = this.category;
    data['class'] = this.class1;
    data['subject'] = this.subject;
    data['image'] = this.image;
    data['device_type'] = this.deviceType;
    data['device_token'] = this.deviceToken;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['description'] = this.description;
    data['rating'] = this.rating.toString();
    data['created_date'] = this.createdDate;
    data['updated_date'] = this.updatedDate;
    data['status'] = this.status;
    data['type'] = this.type;
    data['degree_name'] = this.degree_name;
    data['course_name'] = this.course_name;
    data['category_name'] = this.category_name;
    data['class_name'] = this.class_name;
    data['subject_name'] = this.subject_name;
    data['student_rating'] = teacherRatingData?.toJson();
    data['overallrating'] = overallrating;
    data['student_ratingto_teacher'] = student_ratingto_teacher;
    data['language_name'] = language_name;
    return data;
  }
}