import 'package:flutter/material.dart';
import 'package:whatsappclone/colors.dart';

class WebSearchBar extends StatelessWidget {
  const WebSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width*0.06,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor),
        )
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: searchBarColor,
          prefix: const Padding(
              padding: EdgeInsets.symmetric
                (horizontal: 20),
          child: Icon(Icons.search,size: 20,),),
            hintText: 'search or start a new chat ',
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            )
          ),
          contentPadding: EdgeInsets.all(10),
        ),
      ),

    );
  }
}
