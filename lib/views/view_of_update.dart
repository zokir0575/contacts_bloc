import 'package:contacts_bloc/blocs/update_contact_cubit.dart';
import 'package:contacts_bloc/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context, TextEditingController titleController, TextEditingController bodyController, String id){
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
              maxLines: 8,
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
                child: Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 20),),
                onPressed: (){
                  Post post = Post(fullname: titleController.text.toString(), mobile: bodyController.text.toString(), id: id);
                  BlocProvider.of<UpdateContactCubit>(context).apiUpdateContact(context, post);
                },
              ),
            ),
          ],
        ),
      ),

      isLoading ? Center(child: CircularProgressIndicator()) : SizedBox.shrink(),
    ],
  );
}