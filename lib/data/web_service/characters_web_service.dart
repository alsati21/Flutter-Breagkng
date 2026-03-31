import 'package:dio/dio.dart';
import 'package:untitled/constans/strings.dart';

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

  Future<List<dynamic>>getAllCharacters()async
  {
    try {
      Response response = await dio.get('character');
      print(response.data.toString());
      return response.data;


    }
    catch(e)
    {
      print(e.toString());
      return [];
    }

  }

}