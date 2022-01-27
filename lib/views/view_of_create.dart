

import 'package:contacts_bloc/blocs/create_contact_cubit.dart';
import 'package:contacts_bloc/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfCreate(bool isLoading, BuildContext context, TextEditingController titleController, TextEditingController bodyController){
  return  Stack(
    children: [
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Post Title",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(right: 15, left: 15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: "Post Body",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.only(
                    right: 15, top: 15, bottom: 50, left: 15),
              ),
              maxLines: 7,
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.indigoAccent,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                child: Text('Create Post', style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: (){
                  Post post = Post(fullname: titleController.text.toString(), mobile: bodyController.text.toString());
                  BlocProvider.of<CreateContactCubit>(context).apiCreateContact(post);
                }
              ),
            ),
          ],
        ),
      ),

      isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
    ],
  );
}