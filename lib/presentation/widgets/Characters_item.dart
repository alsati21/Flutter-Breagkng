
import 'package:flutter/material.dart';
import 'package:untitled/constans/colors.dart';
import 'package:untitled/data/model/charactes_model.dart';
class CharactersItem extends StatelessWidget {
  CharactersModel charactersModel;
   CharactersItem({super.key,required this.charactersModel});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 10,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: myColors.whit,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(footer: Container(
               width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                 color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text('${charactersModel.name}',
            style: const TextStyle(color: myColors.whit,fontSize: 16,height: 1.3),
          ),

        ),child:
      Container(
        height: 10,
        color: myColors.gray,
        child: charactersModel.image.isNotEmpty?
        FadeInImage.assetNetwork(placeholder: 'asset/images/OIP.jpg', image: charactersModel.image,fit: BoxFit.cover):

        Image.asset('name')

      ),


      ),

    );
  }
}
