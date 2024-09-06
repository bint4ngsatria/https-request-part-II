import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:httpsrequestxirpl3part2/models/ToDo.dart';


class HttpService {
  final String baseUrl ='https://jsonplaceholder.typicode.com/';

  Future<List?> getToDo() async { 
    final String uri = baseUrl;
    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['data']; 
      List todos = moviesMap.map((i) => ToDo.fromJson(i)).toList(); 
      return todos;
    } else{
      print('Fail');
      List.empty();
      return List.empty();
    }
  }
}