import 'package:a19_blog_post_api/controller/post_list_controller.dart';
import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:a19_blog_post_api/widgets/post_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  final PostListController postListController = Get.put(PostListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Obx(() {
        PostListState state = postListController.postListState.value;
        if (state is PostListLoading) {
          return Shimmer.fromColors(
              child: ListView(
                children: [
                  for (int i = 0; i <= 10; i++)
                    Container(
                      height: 20,
                      margin: EdgeInsets.all(8),
                      color: Colors.grey,
                    ),
                ],
              ),
              baseColor: Colors.grey,
              highlightColor: Colors.white);
        } else if (state is PostListSuccess) {
          List<PostListModel> postLists = state.postLists;
          return PostListView(
            posts: postLists,
          );
        } else if (state is PostListError) {
          return Center(
            child: Text('Error'),
          );
        } else {
          return Center();
        }
      }),
    );
  }
}
