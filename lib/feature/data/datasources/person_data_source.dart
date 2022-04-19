import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/feature/data/models/person_model.dart';

Future<List<PersonModel>> getAllPersons(int page) async {
  final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'),
      headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    final persons = json.decode(response.body);
    return (persons['results'] as List)
        .map((person) => PersonModel.fromJson(person))
        .toList();
  } else {
    throw ServerException();
  }
}
