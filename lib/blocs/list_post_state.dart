
import 'package:contacts_bloc/model/post_model.dart';
import 'package:equatable/equatable.dart';

abstract class ListPostState extends Equatable{
  List<Object> get props => [];
}

class ListPostInit extends ListPostState{}

class ListPostLoading extends ListPostState{}

class ListPostLoaded extends ListPostState{
  final List<Post> post;
  final bool isDeleted;

  ListPostLoaded({this.post, this.isDeleted});
}

class ListPostError extends ListPostState{
  final error;
  ListPostError({this.error});
}