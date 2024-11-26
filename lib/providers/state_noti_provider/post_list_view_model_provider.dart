

import 'package:class_riverpod_mvvm/models/post.dart';
import 'package:class_riverpod_mvvm/providers/provider/post_repository_provider.dart';
import 'package:class_riverpod_mvvm/view_models/post_list_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// PostListViewModel 을 관리하는 프로바이더 생성 입니다

final postListViewModelProvider = StateNotifierProvider<PostListViewModel,List<Post>>(( ref){

  final _postRepositoryImpl= ref.read(postRepositoryProvider);

  return PostListViewModel(_postRepositoryImpl);
});