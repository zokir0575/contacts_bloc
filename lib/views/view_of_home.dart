
import 'package:contacts_bloc/model/post_model.dart';
import 'package:contacts_bloc/views/item_of_contact.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

Widget viewOfHome(List<Post> items, bool isLoading){
  return Stack(
    children: [
      Container(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            return itemOfList(context: ctx, post: items[index]);
          },
        ),
      ),
      isLoading ?
      Center(
        child: CircularProgressIndicator(),
      ) : SizedBox.shrink()
    ],
  );
}