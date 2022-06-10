import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/favorite_storage.dart';
import '../../controllers/film_api.dart';
import '../../models/film.dart';
import '../../models/ref_film.dart';
import 'favorite_screen.dart';
import 'detail_screen.dart';

class FilmScreen extends StatefulWidget {
  static List<RefFilm> refFilms = [];

  const FilmScreen({Key? key}) : super(key: key);

  @override
  State<FilmScreen> createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  List<Film> _films = [];
  List<Film> _favoriteFilms = [];
  final FilmApi _filmsApi = FilmApi();
  final FavoriteStorage _favoriteStorage = FavoriteStorage();

  @override
  void initState() {
    super.initState();
    _loadAllFilms();
  }

  _loadAllFilms() async {
    final films = await _filmsApi.fetchFilms();
    setState(() {
      _films = films;
      for (var film in _films) {
        var found = false;
        for (var refFilm in FilmScreen.refFilms) {
          if (refFilm.film.id == film.id) {
            found = true;
          }
        }
        if (!found) {
          FilmScreen.refFilms.add(RefFilm(film, false));
        }
      }
      _loadAndUpdateFavorites();
    });
  }

  _loadAndUpdateFavorites() {
    _favoriteStorage.loadFavorites().then((List<Film> value) {
      _favoriteFilms = value;
      for (var film in _favoriteFilms) {
        for (var element in FilmScreen.refFilms) {
          if (element.film.id == film.id) {
            element.isFavorite = true;
          }
        }
      }
    });
  }

  void _updateFavoriteState(String filmId, bool filmTag) {
    for (var element in FilmScreen.refFilms) {
      if (element.film.id == filmId) {
        element.isFavorite = filmTag;
      }
    }
    _favoriteStorage.saveFavorites(FilmScreen.refFilms);
  }

  int _favoriteCount() {
    var count = 0;
    for (var element in FilmScreen.refFilms) {
      if (element.isFavorite) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Studio Ghibli Films',
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            actions: [
              _favoriteCount() > 0
                  ? (Row(children: [
                Text('${_favoriteCount()}',
                    style: GoogleFonts.roboto(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 5),
                const FaIcon(FontAwesomeIcons.solidHeart, size: 22.5),
                IconButton(
                    splashColor:
                    Theme.of(context).brightness == Brightness.light
                        ? Colors.deepPurple.shade200
                        : Colors.white38,
                    splashRadius: 23,
                    iconSize: 22.5,
                    icon: const FaIcon(FontAwesomeIcons.chevronRight,
                        color: Colors.white),
                    onPressed: () {
                      if (_favoriteCount() > 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                const FavoriteScreen()))
                            .then((value) => setState(() {}));
                      }
                    })
              ]))
                  : const Text('')
            ]),
        body: ListView.builder(
            itemCount: FilmScreen.refFilms.length,
            itemBuilder: (context, index) {
              return Card(
                  margin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 2,
                  child: ListTile(
                      leading:
                      Image.network(FilmScreen.refFilms[index].film.image),
                      title: Text(FilmScreen.refFilms[index].film.title,
                          style: GoogleFonts.roboto(fontSize: 18)),
                      subtitle: Text(
                          FilmScreen.refFilms[index].film.releaseDate,
                          style: GoogleFonts.roboto(fontSize: 14)),
                      trailing: IconButton(
                          splashColor:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.deepPurple.shade200
                              : Colors.white38,
                          splashRadius: 23,
                          iconSize: 25,
                          icon: FaIcon(
                              FilmScreen.refFilms[index].isFavorite
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart,
                              color: Theme.of(context).brightness ==
                                  Brightness.light
                                  ? Colors.deepPurple
                                  : Colors.white,
                              semanticLabel:
                              FilmScreen.refFilms[index].isFavorite
                                  ? 'Liked'
                                  : 'Not Liked'),
                          onPressed: () {
                            setState(() {
                              _updateFavoriteState(
                                  FilmScreen.refFilms[index].film.id,
                                  !FilmScreen.refFilms[index].isFavorite);
                            });
                          }),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    film: FilmScreen.refFilms[index].film)));
                      }));
            }));
  }
}