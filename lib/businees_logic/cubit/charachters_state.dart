import '../../data/model/charactes_model.dart';

abstract class CharactersState{}
class CharactersInitial extends CharactersState{}
class CharactersLoaded extends CharactersState
{
  final List<CharactersModel>character;
  CharactersLoaded(this.character);


}