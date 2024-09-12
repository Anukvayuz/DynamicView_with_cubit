import 'package:dynamic_ui_cubit/Model/model_class.dart';

class PostState {}

class PostLoadingState extends PostState {}

class PostInitialState extends PostState {}

class PostLoadedState extends PostState {
  final List<Model> posts;
  final bool toggle;
  final bool toggle2;
  PostLoadedState(this.posts, {required this.toggle, required this.toggle2});

  PostLoadedState copyWith({
    final bool? toggle,
    final bool? toggle2,
    

  }) {
    return PostLoadedState(
      posts,
      toggle: toggle ?? this.toggle,
      toggle2: toggle2 ?? this.toggle2,
    );
  }
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
