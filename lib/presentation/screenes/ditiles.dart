import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/constans/colors.dart';
import 'package:untitled/data/model/charactes_model.dart';
class Ditiles extends StatelessWidget {
  final CharactersModel charactersModel;
  const Ditiles({super.key, required this.charactersModel});
Widget characterInfo(String title,String value)
{
  return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
    children:[
      TextSpan(
        text: title,
        style: const TextStyle(
          color: myColors.whit,
          fontSize: 18,
          fontWeight: FontWeight.bold

        )
      ),

      TextSpan(
          text: value,
          style: const TextStyle(
              color: myColors.whit,
              fontSize: 16,

          )
      ),
    ]

  ));
}
Widget buidDrivider(double endIndent)
  {
    return Divider(
      color: myColors.yellow,
      endIndent:endIndent ,
      height: 30,
      thickness: 3,

      );
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: myColors.gray,
      body: CustomScrollView(
        slivers: [
         SliverAppBar(
           centerTitle: true,

           expandedHeight: 600,
           pinned: true,
           stretch: true,
           backgroundColor: myColors.gray,
           flexibleSpace: FlexibleSpaceBar(

             title: Text(charactersModel.name!,style: const TextStyle(

               color: Colors.white,
               fontWeight: FontWeight.bold,

             ),),
             
             background: Hero(tag: charactersModel.id!, child: Image.network(charactersModel.image,fit: BoxFit.cover,)),
           ),
         ),
          SliverList(delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.fromLTRB(14, 14, 14,0),
              child: Column(
mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  characterInfo('episode: ',charactersModel.episode!.join('/')),
                  buidDrivider(287),
                  characterInfo('status: ',charactersModel.status!),
                  buidDrivider(302),
                  characterInfo('gender: ',charactersModel.gender!),
                  buidDrivider(291),
                  characterInfo('location: ',charactersModel.location!.url!),
                  buidDrivider(290),
                  characterInfo('created: ',charactersModel.created!),
                  buidDrivider(290),
                  characterInfo('species: ',charactersModel.species!),
                  buidDrivider(290),
                  characterInfo('origin: ',charactersModel.origin!.name!),
                  buidDrivider(302),
                  charactersModel.type!.isEmpty?Container():
                  characterInfo('type: ',charactersModel.type!),
                  charactersModel.type!.isEmpty?Container():
                  buidDrivider(302),
                  const SizedBox(height: 20,)
                ],

              ),
            ),
            const SizedBox(height: 400,)




          ]),),
        ],
        
        
      ),
    );
  }
}
