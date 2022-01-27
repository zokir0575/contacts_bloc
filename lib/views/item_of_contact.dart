import 'package:contacts_bloc/blocs/list_post_cubit.dart';
import 'package:contacts_bloc/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


Widget itemOfList({BuildContext context, Post post}) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    actionExtentRatio: 0.2,
    child: ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[300]
        ),
        child: Icon(Icons.person, color: Colors.white, size: 30,),
      ),
      title: Text(post.fullname,),
      subtitle: Text(post.mobile),
    ),
    actions: <Widget>[
      IconSlideAction(
        caption: 'Update',
        color: Colors.indigo,
        icon: Icons.edit,
        onTap: () {
          BlocProvider.of<ListPostCubit>(context).apiUpdateContact(context, post);
        },
      ),
    ],
    secondaryActions: <Widget>[
      IconSlideAction(
        caption: 'Delete',
        color: Colors.red,
        icon: Icons.delete,
        onTap: () {
          BlocProvider.of<ListPostCubit>(context).apiDeleteContact(post);
        },
      ),
    ],
  );
}