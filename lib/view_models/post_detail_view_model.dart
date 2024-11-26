// 뷰 모델 --> 무조건 StateNotifier 상속 받자
// StateNotifier --> 관리 해야 하는 상태값은 뭘까?
// StateNotifier <-- 상태는 캡슐화 된다.
import 'package:class_riverpod_mvvm/models/post.dart';
import 'package:class_riverpod_mvvm/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 외부에서 접근하는 상태 변순는 stsate 된다 --> T 제네릭이기 때문에 실제 값은 Post 객체 이다.
class PostDetailViewModel extends StateNotifier<AsyncValue<Post>> {
  final PostRepository _postRepository;
  final int postId;

  // Async 비동기 통신 (통신을 할때) 3가지 상태를 구분 지어서 화면을 구성하는데 매운 편리하다
  // 1-로딩, 2- 데이터, 3-오류
  PostDetailViewModel(this._postRepository, this.postId)
      : super(AsyncValue.loading()) {
    // 객체 생성시에 비즈니스 로직 호출
    fetchPostGetById();
;  }

  // 비즈니스 로직
  Future<void> fetchPostGetById() async {
    try {
      // 응답 받은 post 객체
      final post = await _postRepository.fetchPostById(postId);
      state = AsyncValue.data(post);
    } catch (e, stackTrace) {
      // e: 오류메세지
      // stackTrace : 개발 시점에 어디서 오류가 발생했는지 추적 계층 구조를 던져 준다,
      state = AsyncValue.error(2, stackTrace);
      throw Exception('통신중 오류 발생 $e');
    }
  }
}
