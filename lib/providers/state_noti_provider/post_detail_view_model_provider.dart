import 'package:class_riverpod_mvvm/models/post.dart';
import 'package:class_riverpod_mvvm/providers/provider/post_repository_provider.dart';
import 'package:class_riverpod_mvvm/view_models/post_detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postDetailViewModelProvider =
    StateNotifierProvider.family<PostDetailViewModel, AsyncValue<Post>, int>(
        (ref, postId) {
            // 1. postId 값은 family 를 통해 전달받은 외부 매개변수로 , 특정ㅇ 게시글을 식별하는데 사용 된다.
            final postRepository =ref.read(postRepositoryProvider);
            return PostDetailViewModel(postRepository, postId);
        });
