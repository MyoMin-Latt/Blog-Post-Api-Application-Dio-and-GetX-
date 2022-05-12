

import 'package:a19_blog_post_api/data/api_service/post_api_service.dart';
import 'package:a19_blog_post_api/model/blog_post_model.dart';
import 'package:get/get.dart';

class BlogPostController extends GetxController{
  PostApiService _postApiService = Get.find();
  Rx<BlogPostState> blogPostState = BlogPostState().obs;
  void getBlogPost(int id){
    blogPostState.value = BlogPostLoading();
    _postApiService.getPost(id).then((posts) {
      if(posts.isNotEmpty){
        blogPostState.value = BlogPostSuccess(posts[0]);
      }
    }
    ).catchError((e){
      blogPostState.value = BlogPostError();
    });
  }
}

class BlogPostState{}
class BlogPostLoading extends BlogPostState{}
class BlogPostSuccess extends BlogPostState{
  final BlogPostModel blogPost;
  BlogPostSuccess(this.blogPost);
}
class BlogPostError extends BlogPostState{}
