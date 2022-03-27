import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final List<PostListModel>? posts;
  const PostListView({
    Key? key, this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts?.length,
      itemBuilder: (context, index){
        return Card(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(posts?[index].title ?? '',),
        ));
      });
  }
}

