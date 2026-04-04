import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/businees_logic/cubit/charachters_cubit.dart';
import 'package:untitled/data/web_service/characters_web_service.dart';
import 'package:untitled/presentation/screenes/character_screen.dart';
import 'package:untitled/presentation/screenes/ditiles.dart';
import 'constans/strings.dart';
import 'data/repositroy/characters_repositroy.dart';
class AppRouter
{
  late CharactersRepository charactersRepository;
  late CharacterCubit characterCubit;
  AppRouter()
  {
    charactersRepository=CharactersRepository(CharactersWebService());
    characterCubit =CharacterCubit(charactersRepository);
  }
  Route ?generateRoute(RouteSettings settings)

  {
   switch(settings.name)
       {
     case charactersScreen:
       return MaterialPageRoute(builder: (_)=>
       BlocProvider(create: (BuildContext contxt)=>characterCubit,
         child: CharacterScreen(),

       ),


       );
     case ditiles:
       return MaterialPageRoute(builder: (_)=>Ditiles());
   }

  }


}
