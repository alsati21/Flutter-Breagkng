import 'package:untitled/data/web_service/characters_web_service.dart';

import '../model/charactes_model.dart';

class CharactersRepository
{
   final CharactersWebService charactersWebService;
   CharactersRepository(this.charactersWebService);

   Future<List<CharactersModel>>getAllCharacters()async
   {
final characters=await charactersWebService.getAllCharacters();
return characters.map((characters)=>CharactersModel.fromJson(characters)).toList();
   }

}