import 'package:mobile_bootcamp_flutter/day_44/ownerModel.dart';

class Data {
  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;

  Data(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner});

  Data.fromJson(Map<String, dynamic> json) {
    try{
      print('jkh22k');
      id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = json['tags'].cast<String>();
    text = json['text'];
    publishDate = json['publishDate'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    }catch(e){print(e);}
  }
}
