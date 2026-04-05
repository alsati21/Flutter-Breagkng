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
        decoration: const InputDecoration(
          hintText: 'find a characters...',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: myColors.gray,
            fontSize: 18,

          ),

        ),
        style: const TextStyle(color: myColors.gray,fontSize: 18),
        onChanged: (search)
        {
          addItemToSearchCharactersList(search);

        },


      );
    }
    void addItemToSearchCharactersList(String search)
    {
      searchCharacters=allCharacters.where((character)=>character.name!.toLowerCase().startsWith(search.toLowerCase())).toList();

  setState(() {

  });

    }
    List<Widget>buildAppBarAction()
     {
       if(_isSearching)
         {
           return [IconButton(onPressed: (){clear();Navigator.pop(context);}, icon: const Icon(Icons.clear,color: myColors.gray,))];
         }
       else
         {
           return [IconButton(onPressed: startSearch,



               icon: const Icon(Icons.search,color: myColors.gray,))];
         }
   }
void startSearch()
{
  ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:stopSearch ));
  setState(() {
    _isSearching=true;
  });

}
void stopSearch()
{
  setState(() {
    _isSearching=false;
    clear();
  });

}
void clear()
{
  setState(() {
    _searchTextController.clear();

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
              itemCount:_searchTextController.text.isEmpty? allCharacters.length:searchCharacters.length,
              itemBuilder: (context, index) {
                return CharactersItem(
                  charactersModel:_searchTextController.text.isEmpty? allCharacters[index]:searchCharacters[index],
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
      leading: _isSearching?const BackButton(color: myColors.gray,):Container(),
      backgroundColor: myColors.yellow,
      title: _isSearching?_buildSearch(): const Text(
        'Characters',
        style: TextStyle(color: myColors.gray),

      ),
      actions: buildAppBarAction(),

    ),
      body:builBlocWidget() ,



    );
  }
}
