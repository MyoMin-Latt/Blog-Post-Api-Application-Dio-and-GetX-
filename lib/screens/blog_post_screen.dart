import 'package:a19_blog_post_api/controller/blog_post_controller.dart';
import 'package:a19_blog_post_api/model/blog_post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../data/api_service/post_api_service.dart';

class BlogPostScreen extends StatefulWidget {
  final String title;
  final int id;
  const BlogPostScreen({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  State<BlogPostScreen> createState() => _BlogPostScreenState();
}

class _BlogPostScreenState extends State<BlogPostScreen> {
  final BlogPostController blogPostController = Get.put(BlogPostController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogPostController.getBlogPost(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Obx(() {
        BlogPostState state = blogPostController.blogPostState.value;
        if (state is BlogPostSuccess) {
          BlogPostModel blogPost = state.blogPost;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(blogPost.title!)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(blogPost.body!)),
              ),
              (blogPost == null)
                  ? const SizedBox()
                  : Image.network(
                      '${PostApiService.baseUrl}/${blogPost.photo}',
                      height: 300,
                    )
            ],
          );
        } else if (state is BlogPostError) {
          return Center(
            child: Text('Error'),
          );
        } else if (state is BlogPostLoading) {
          return Shimmer.fromColors(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 20,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 7),
                  Container(
                    height: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 7),
                  Container(
                    height: 70,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            baseColor: Colors.grey,
            highlightColor: Colors.white,
          );
        }
        return const SizedBox();
      }),
    );
  }
}
