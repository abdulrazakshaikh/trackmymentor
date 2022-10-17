class HelperData {
  String? id;
  String? name;
  bool isSelected = false;

  HelperData({this.id, this.name});

  HelperData.fromJson(Map<String, dynamic> json) {
    print(json['name']);
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
