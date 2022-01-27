
import 'package:contacts_bloc/blocs/update_contact_state.dart';
import 'package:contacts_bloc/model/post_model.dart';
import 'package:contacts_bloc/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateContactCubit extends Cubit<UpdateContactState>{
  UpdateContactCubit() : super (UpdateContactInit());

  Future<void> apiUpdateContact(BuildContext context, Post post)async{
    emit(UpdateContactLoading());
    String response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if(response != null ){
      emit(UpdateContactLoaded(isUpdated: true));
      Navigator.pop(context, response);
    }else{
      emit(UpdateContactError(error: "Can not update contact"));
    }
  }
}