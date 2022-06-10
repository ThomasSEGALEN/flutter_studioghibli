import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/film.dart';
import '../models/ref_film.dart';

class FavoriteStorage {
  Future<void> saveFavorites(List<RefFilm> refFilms) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final RefFilm refFilm in refFilms) {
      if (refFilm.isFavorite) {
        listJson.add(jsonEncode(refFilm.film.toJson()));
      }
    }
    sharedPreferences.setStringList('favorite', listJson);
  }

  Future<List<Film>> loadFavorites() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final List<Film> films = [];
    final List<String> listJson =
        sharedPreferences.getStringList('favorite') ?? [];
    for (final String json in listJson) {
      films.add(Film.fromJson(jsonDecode(json)));
    }
    return films;
  }
}
