import 'package:a19_blog_post_api/data/api_service/post_api_service.dart';
import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  PostApiService _postApiService = Get.find();
  Rx<PostListState> postListState = PostListState().obs;
  void getAllPosts() {
    postListState.value = PostListLoading();
    _postApiService.getAllPosts().then((postLists) {
      postListState.value = PostListSuccess(postLists);
    }).catchError(() {
      postListState.value = PostListError();
    });
  }
}

class PostListState {}

class PostListLoading extends PostListState {}

class PostListSuccess extends PostListState {
  final List<PostListModel> postLists;
  PostListSuccess(this.postLists);
}

class PostListError extends PostListState {}
