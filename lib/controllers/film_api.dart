import 'dart:convert';

import 'package:http/http.dart';

import '../models/film.dart';

class FilmApi {
  Future<List<Film>> fetchFilms() async {
    final Response response =
        await get(Uri.parse('https://ghibliapi.herokuapp.com/films'));
    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return list.map((film) => Film.fromJson(film)).toList();
    } else {
      throw Exception('Failed to load films!');
    }
  }
}
