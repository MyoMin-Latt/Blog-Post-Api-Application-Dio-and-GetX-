import 'package:a19_blog_post_api/model/blog_post_model.dart';
import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:a19_blog_post_api/model/response_status.dart';
import 'package:dio/dio.dart';


class PostApiService{
  static const baseUrl = 'https://rubylearner.herokuapp.com';
  Dio _dio = Dio();
  Future<List<PostListModel>> getAllPosts() async{
    var result =await _dio.get('$baseUrl/posts');
    List postList = result.data as List;
    return postList.map((post) => PostListModel.fromJson(post)).toList();
  }

  Future<List<BlogPostModel>> getPost(int id)async{
    var result = await _dio.get('$baseUrl/post?id=$id');
    List postList = result.data as List;
    return postList.map((post) => BlogPostModel.fromJson(post)).toList();
  }
  Future<ResponseStatus> uploadPost({required String title, required String body, required FormData photo})async{
    var result = await _dio.post('$baseUrl/post?title=$title&body=$body', data: photo);
    ResponseStatus responseStatus = ResponseStatus.fromJson(result.data);
    return responseStatus;
  }
}

