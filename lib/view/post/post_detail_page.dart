import 'package:class_riverpod_mvvm/providers/state_noti_provider/post_detail_view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailPage extends ConsumerWidget {
  final postId;

  const PostDetailPage({required this.postId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 화면을 만들기 위해서 뷰 모델이 관리하는 상태(ㄷ데이터가)가 필요 하다.
    // postDetailViewModelProvider 에 패밀리 중 하나를 가져 와야 한다.
    final postState = ref.watch(postDetailViewModelProvider(postId));
    // post <-- 데이터 타입이 뭘까. AsyncValue<Post> 객체 이다.
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글 상세 보기 화면'),
      ),
      body: postState.when(
        data: (post) => Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                post.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                post.body,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
        error: (e, stack) => Center(
          child: Text('네트워크 오류 발생'),
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
