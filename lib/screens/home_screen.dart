import 'package:a19_blog_post_api/data/api_service/post_api_service.dart';
import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:a19_blog_post_api/widgets/post_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostApiService _postApiService = PostApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<PostListModel>>(
          future: _postApiService.getAllPosts(),
          builder: (context, snapshot) {
            List<PostListModel> posts = snapshot.data ?? [];
            if (snapshot.hasData) {
              return PostListView(posts: posts,);
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error'),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
