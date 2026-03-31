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
    late List<CharactersModel>allCharacters;
  @override
  void initState()
  {
    super.initState();
    allCharacters=BlocProvider.of<CharacterCubit>(context).getAllCharacters();
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
  Widget buildLoadedListWidgets()
  {
return SingleChildScrollView(
  child: Container(
    color: myColors.gray,
    child: Column(
children: [

GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
  (
    crossAxisCount: 2,
  crossAxisSpacing:1,
  childAspectRatio: 2/3,
  mainAxisSpacing: 1
),

    itemBuilder:(contxt,index)
    {
      return CharactersItem();


    } )

],


    ) ,

  ),

);
  }


  Widget build(BuildContext context)

  {
    return  Scaffold(
    appBar: AppBar(
      backgroundColor: myColors.yellow,
      title: const Text(
        'Characters',
        style: TextStyle(color: myColors.gray),
      ),

    ),
      body:builBlocWidget() ,



    );
  }
}
