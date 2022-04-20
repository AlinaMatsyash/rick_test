import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/feature/data/models/episode_model.dart';
import 'package:rickandmorty/feature/data/models/location_model.dart';
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

Future<List<EpisodeModel>> getAllEpisodes(int page) async {
  final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/episode/?page=$page'),
      headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    final episodes = json.decode(response.body);
    return (episodes['results'] as List)
        .map((episode) => EpisodeModel.fromJson(episode))
        .toList();
  } else {
    throw ServerException();
  }
}

Future<List<LocationModel>> getAllLocations(page) async {
  final response = await http.get(
      Uri.parse('https://rickandmortyapi.com/api/location/?page=$page'),
      headers: {'Content-Type': 'application/json'});
  if (response.statusCode == 200) {
    final persons = json.decode(response.body);
    return (persons['results'] as List)
        .map((person) => LocationModel.fromJson(person))
        .toList();
  } else {
    throw ServerException();
  }
}
