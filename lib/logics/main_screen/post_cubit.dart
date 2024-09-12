import 'package:dynamic_ui_cubit/Model/model_class.dart';
import 'package:dynamic_ui_cubit/api/repository/post_repository.dart';
import 'package:dynamic_ui_cubit/logics/main_screen/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitialState()) {
    ///   fetchPosts();
  }

  // PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    emit(PostLoadingState());
    try {
      List<Model> posts = await PostRepository().fetchPosts();
      emit(PostLoadedState(posts, toggle: false, toggle2: false));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }

  Future<void> setToggle() async {
    final currentState = state as PostLoadedState;

    emit(currentState.copyWith(toggle: !currentState.toggle));
  }
}
