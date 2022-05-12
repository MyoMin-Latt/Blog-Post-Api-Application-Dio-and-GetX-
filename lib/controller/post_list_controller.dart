import 'package:a19_blog_post_api/data/api_service/post_api_service.dart';
import 'package:a19_blog_post_api/model/post_list_model.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  PostApiService _postApiService = Get.find();
  Rx<PostListState> postListState = PostListState().obs;
  @override
  void onInit() {
    super.onInit();
    getAllPosts();
  }

  void getAllPosts() {
    postListState.value = PostListLoading();
    _postApiService.getAllPosts().then((postLists) {
      postListState.value = PostListSuccess(postLists);
    }).catchError((e) {
      postListState.value = PostListError();
    });
  }
}

class PostListState {}

class PostListLoading extends PostListState {
  PostListLoading() {
    print('PostList _ Loading');
  }
}

class PostListSuccess extends PostListState {
  final List<PostListModel> postLists;
  PostListSuccess(this.postLists) {
    print('PostList _ Success');
  }
}

class PostListError extends PostListState {
  PostListError() {
    print('PostList _ Error');
  }
}
