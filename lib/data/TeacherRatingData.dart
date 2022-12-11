class TeacherRatingData {
  String? id;
  String? projectId;
  String? teacherId;
  String? teacherName;
  String? image;
  String? rating;
  String? comment;
  String? created_date;

  TeacherRatingData({
    this.id,
    this.projectId,
    this.teacherId,
    this.teacherName,
    this.image,
    this.rating,
    this.comment,
    this.created_date,
  });

  TeacherRatingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    teacherId = json['teacher_id'];
    teacherName = json['teacher_name'];
    if (teacherName == null || teacherName!.isEmpty) {
      teacherName = json['student_name'];
    }
    image = json['image'];
    rating = json['rating'];
    comment = json['comment'];
    created_date = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['teacher_id'] = this.teacherId;
    data['teacher_name'] = this.teacherName;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_date'] = this.created_date;
    return data;
  }
}
