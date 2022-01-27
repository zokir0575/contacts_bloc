

import 'package:contacts_bloc/blocs/list_post_state.dart';
import 'package:contacts_bloc/model/post_model.dart';
import 'package:contacts_bloc/pages/create_page.dart';
import 'package:contacts_bloc/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/update_page.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit() : super (ListPostInit());
  void apiContactList()async{
    emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    print(response);
    if(response != null){
      emit(ListPostLoaded(post: Network.parsePostList(response)));
    }else{
      emit(ListPostError(error: "Can not load contact"));
    }
  }

  void apiDeleteContact(Post post)async{
    emit(ListPostLoading());
    final response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);
    if(response != null){
      apiContactList();
    }else{
      emit(ListPostError(error: "can not delete contact"));
    }
  }

  Future apiUpdateContact(BuildContext context, Post post) async {
    String response = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdatePage(post: post,),),);
    if (response != null) apiContactList();
  }

  void callCreatePage(BuildContext context)async{
    var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreatePage() ));
    if(result != null ) {
      BlocProvider.of<ListPostCubit>(context).apiContactList();
    }
  }
}