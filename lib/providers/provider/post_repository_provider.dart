
// PostRepositoryImpl 인스턴스를 제공하는 Riverpod Provider 계열 입니다.


// 컨테이너에 넣는 코드
import 'package:class_riverpod_mvvm/providers/provider/dio_provider.dart';
import 'package:class_riverpod_mvvm/repository/post_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// (ref) {....} 익명 함수 ㅇ이며,ref는 Riverpod 에서 제공하는 통로 객체 입니다.
/// ref를 통해 프로바이더 내에서 다른 프로바이더를 읽거나 라이프 사이클을 관리 할 수 있다.
final postRepositoryProvider =  Provider<PostRepositoryImpl>((ref) {

  final dio= ref.read(dioProvider);
  // 의존성 주입 -> dio는 Provider가 관리하고있는 객체라 프로바이더를 통해서 가져 왔다.
  return PostRepositoryImpl(dio);
});