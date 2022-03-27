class PostListModel {
  int? id;
  String? title;
  PostListModel({this.id, this.title});
  factory PostListModel.fromJson(Map<String, dynamic> json) {
    return PostListModel(id: json['id'], title: json['title']);
  }
}
