import 'package:contacts_bloc/blocs/list_post_cubit.dart';
import 'package:contacts_bloc/blocs/list_post_state.dart';
import 'package:contacts_bloc/pages/update_page.dart';
import 'package:contacts_bloc/services/http_service.dart';
import 'package:contacts_bloc/views/view_of_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../model/post_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
 static final String id = "home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<Post> items = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiContactList();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: BlocBuilder<ListPostCubit, ListPostState>(
          builder: (BuildContext context, ListPostState state){
            if(state is ListPostError){
              return viewOfHome(items, true);
            }
            if(state is ListPostLoaded){
              items = state.post;
              return viewOfHome(items, false);
            }
            return viewOfHome(items, true);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
           onPressed: (){
            BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
           },
          child: Icon(Icons.add),
        ),
      );
    }

  }

