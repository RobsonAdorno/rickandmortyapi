import 'package:dio/dio.dart';

import '/repositories/interfaces/i_home.dart';
import '/shareds/shareds.dart';

class HomeRepository implements IHome {
  @override
  Future<List> fetchApi() async {
    const api = '/api/character';
    List characters;

    try {
      Response? response = await Dio().get('$baseURL$api');
      characters = response.data['results'];
    } on DioError catch (error) {
      throw Exception(error.response?.statusMessage ?? 'Error');
    }
    return characters;
  }
}
