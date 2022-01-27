import 'package:contacts_bloc/blocs/create_contact_cubit.dart';
import 'package:contacts_bloc/blocs/create_contact_state.dart';
import 'package:contacts_bloc/services/http_service.dart';
import 'package:contacts_bloc/views/view_of_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/post_model.dart';
class CreatePage extends StatefulWidget {
  const CreatePage({Key key}) : super(key: key);
  static final String id = "create_page";
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  _finish(BuildContext context){
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateContactCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Contact"),
        ),
        body: BlocBuilder<CreateContactCubit, CreateContactState>(
          builder: (BuildContext context, CreateContactState state){
            if(state is CreateContactLoading){
              viewOfCreate(true, context, titleController, bodyController);
            }
            if(state is CreateContactLoaded){
              _finish(context);
            }
            if(state is CreateContactError){

            }
           return viewOfCreate(false, context, titleController, bodyController);
          },
        ),
      ),
    );
  }
}
