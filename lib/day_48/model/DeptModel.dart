class Dept {
  String? name;
  bool? active;
  String? id;

  Dept({this.name, this.active, this.id});

  Dept.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    active = json['active'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['active'] = this.active;
    data['id'] = this.id;
    return data;
  }
}