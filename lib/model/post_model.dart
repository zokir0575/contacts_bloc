class Post{
  String fullname;
  String mobile;
  String id;
  Post({this.fullname, this.mobile, this.id, });

  Post.fromJson(Map<String, dynamic> json)
  :     id = json["id"],
        fullname = json["fullname"],
        mobile = json["mobile"];

  Map<String, dynamic> toJson() => {
    "id" : id,
    "fullname" : fullname,
    "mobile" : mobile,

  };
}