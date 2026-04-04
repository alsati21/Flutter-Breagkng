import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/businees_logic/cubit/charachters_cubit.dart';
import 'package:untitled/businees_logic/cubit/charachters_state.dart';
import 'package:untitled/constans/colors.dart';
import 'package:untitled/data/model/charactes_model.dart';
import 'package:untitled/presentation/widgets/Characters_item.dart';
class CharacterScreen extends StatefulWidget {
  const  CharacterScreen({super.key});
  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}
class _CharacterScreenState extends State<CharacterScreen> {
     List<CharactersModel>allCharacters=[];
    late List<CharactersModel>searchCharacters;
    bool _isSearching=false;
    final _searchTextController=TextEditingController();
    Widget _buildSearch()
    {
      return  TextField(
        controller: _searchTextController,
        cursorColor: myColors.gray,
        decoration: InputDecoration(
          hintText: 'find a characters...',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: myColors.gray,
            fontSize: 18,

          ),

        ),
        style: TextStyle(color: myColors.gray,fontSize: 18),
        onChanged: (search)
        {
          addItemToSearchCharactersList(search);

        },


      );
    }
    void addItemToSearchCharactersList(String search)
    {
      searchCharacters=allCharacters
          .where((character)=>character.name!.toLowerCase().startsWith(search)).toList();

  setState(() {

  });

    }



  @override

  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getAllCharacters();
  }
  Widget builBlocWidget()
  {
    return BlocBuilder<CharacterCubit,CharactersState>
      (builder: (contxt,state)
    {
      if(state is CharactersLoaded)
        {
          allCharacters=state.character;
          return buildLoadedListWidgets();
        }
      else
        {
return const Center(
  child: CircularProgressIndicator(
    color: myColors.yellow,
  ),

);
        }



    });
  }
    Widget buildLoadedListWidgets() {
      return SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 2 / 3,
              ),
              itemCount: allCharacters.length,
              itemBuilder: (context, index) {
                return CharactersItem(
                  charactersModel: allCharacters[index],
                );
              },
            ),
          ],
        ),
      );
    }

  @override
  Widget build(BuildContext context)

  {
    return  Scaffold(
    appBar: AppBar(
      backgroundColor: myColors.yellow,
      title: const Text(
        'Characters',
        style: TextStyle(color: myColors.whit),
      ),

    ),
      body:builBlocWidget() ,



    );
  }
}
