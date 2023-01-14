import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/film.dart';

Future<List<Film>> fetchAllFilm() async {
  final response =
      await http.get(Uri.parse("https://studioghibliapi-d6fc8.web.app/films"));

  if (response.statusCode == 200) {
    Iterable list = jsonDecode(response.body);

    return list.map((e) => Film.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load films');
  }
}
