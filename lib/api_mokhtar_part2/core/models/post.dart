class Post{
  String? title;
  String? body;
  Post({this.title,this.body});
  Post.fromJson(Map<String,dynamic> row){
    title=row["title"];
    body=row["body"];
  }

  Map<String,dynamic>toJson(){
    return {"title":title,"body":body};
  }
}