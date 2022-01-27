import 'package:contacts_bloc/blocs/create_contact_state.dart';
import 'package:contacts_bloc/model/post_model.dart';
import 'package:contacts_bloc/services/http_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContactCubit extends Cubit<CreateContactState>{
  CreateContactCubit() : super (CreateContactInit());

  void apiCreateContact(Post post)async{
    print(post.toJson());
    emit(CreateContactLoading());
    var result = await Network.POST(Network.API_CREATE , Network.paramsCreate(post));
    print(result);
    if(result != null){
      emit(CreateContactLoaded(isCreated: true));
    }else{
      emit(CreateContactError(error: "Can not create contact"));
    }
  }
}