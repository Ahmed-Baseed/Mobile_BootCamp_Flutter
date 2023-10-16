class MovieDetails {
  int? id;
  String? name;
  String? category;
  double? rating;
  String? imagePath;
  String? type;
  List<String>? season;

  MovieDetails(
      {this.id,
      this.name,
      this.category,
      this.rating,
      this.imagePath,
      this.type,
      this.season});

  MovieDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    rating = json['rating'];
    imagePath = json['imagePath'];
    type = json['type'];
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['rating'] = this.rating;
    data['imagePath'] = this.imagePath;
    data['type'] = this.type;
    data['season'] = this.season;
    return data;
  }
}
