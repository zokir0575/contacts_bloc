import 'package:contacts_bloc/blocs/update_contact_cubit.dart';
import 'package:contacts_bloc/blocs/update_contact_state.dart';
import 'package:contacts_bloc/services/http_service.dart';
import 'package:contacts_bloc/views/view_of_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';

class UpdatePage extends StatelessWidget {
 static final String id = "update_page";
  Post post;
  UpdatePage({this.post});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update"),
        ),
        body: BlocBuilder<UpdateContactCubit, UpdateContactState>(
          builder: (BuildContext context,UpdateContactState state ){
            if(state is UpdateContactLoading){

              return  viewOfUpdate(true, context, titleController, bodyController, post.id);
            }
            if(state is UpdateContactLoaded){}
            if(state is UpdateContactError){}
            return viewOfUpdate(false, context, titleController, bodyController, post.id);
          },
        ),
      ),
    );
  }
}
