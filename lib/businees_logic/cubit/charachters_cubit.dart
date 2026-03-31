
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/data/model/charactes_model.dart';

import '../../data/repositroy/characters_repositroy.dart';
import 'charachters_state.dart';

class CharacterCubit extends Cubit<CharactersState>
{
  CharactersRepository charactersRepository;
 late List<CharactersModel>characters;
  CharacterCubit(this.charactersRepository):super(CharactersInitial());
  List<CharactersModel>getAllCharacters()
  {
    charactersRepository.getAllCharacters().then((characters)
        {
          emit(CharactersLoaded( characters));
          this.characters=characters;

        });
    return characters;



  }


}