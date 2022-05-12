import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:a19_blog_post_api/screens/blog_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostListView extends StatelessWidget {
  final List<PostListModel> posts;
  const PostListView({
    Key? key, required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index){
        return InkWell(
          onTap: (){
            Get.to(BlogPostScreen(title: posts[index].title ?? '', id: posts[index].id ?? 0));
          },
          child: Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(posts[index].title ?? '',),
          )),
        );
      });
  }
}

