import 'package:dio/dio.dart';
import 'package:untitled/constans/strings.dart';

import '../model/charactes_model.dart';

class CharactersWebService
{
  late Dio dio;
  CharactersWebService()
  {
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    //  connectTimeout:20 * 1000 ,
      //receiveTimeout:20 * 1000,
    );
      dio =Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try
    {
    final response = await dio.get('character');

    return response.data['results'];
  }
    catch(e)
    {
      print(e.toString());
      return [];
    }

  }

}