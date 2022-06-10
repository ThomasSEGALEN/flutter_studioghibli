import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/favorite_storage.dart';
import '../../models/film.dart';
import 'detail_screen.dart';
import 'film_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Film> _favoriteFilms = [];
  final FavoriteStorage _favoriteStorage = FavoriteStorage();

  @override
  initState() {
    super.initState();
    _loadAllFavorites();
  }

  void _loadAllFavorites() async {
    _favoriteStorage.loadFavorites().then((List<Film> value) {
      setState(() {
        _favoriteFilms = value;
      });
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

  void _updateAllFavoriteState(List<Film> films) {
    for (var film in films) {
      _updateFavoriteState(film.id, false);
    }
  }

  deleteAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              elevation: 2,
              title: const Text('Delete favorites'),
              content: const Text(
                  'Do you really want to delete your favorite list?'),
              actions: [
                IconButton(
                    splashColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.deepPurple.shade200
                            : Colors.white38,
                    splashRadius: 23,
                    iconSize: 25,
                    icon: const FaIcon(FontAwesomeIcons.xmark),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                IconButton(
                    splashColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.deepPurple.shade200
                            : Colors.white38,
                    splashRadius: 23,
                    iconSize: 25,
                    icon: const FaIcon(FontAwesomeIcons.check),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _updateAllFavoriteState(_favoriteFilms);
                        _favoriteFilms.clear();
                      });
                    })
              ]);
        },
        barrierDismissible: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                splashColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.deepPurple.shade200
                    : Colors.white38,
                splashRadius: 23,
                iconSize: 25,
                icon: const FaIcon(FontAwesomeIcons.angleLeft),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: Text('Favorites',
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold)),
            actions: [
              Row(children: [
                IconButton(
                    splashColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.deepPurple.shade200
                            : Colors.white38,
                    splashRadius: 23,
                    iconSize: 25,
                    icon: const FaIcon(FontAwesomeIcons.solidTrashCan,
                        color: Colors.white),
                    onPressed: () {
                      deleteAlertDialog(context);
                    })
              ])
            ]),
        body: ListView.builder(
            itemCount: _favoriteFilms.length,
            itemBuilder: (context, index) {
              return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 2,
                  child: ListTile(
                      leading: Image.network(_favoriteFilms[index].image),
                      title: Text(_favoriteFilms[index].title,
                          style: GoogleFonts.roboto(fontSize: 18)),
                      subtitle: Text(_favoriteFilms[index].releaseDate,
                          style: GoogleFonts.roboto(fontSize: 14)),
                      trailing: IconButton(
                          splashColor:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.deepPurple.shade200
                                  : Colors.white38,
                          splashRadius: 23,
                          iconSize: 25,
                          icon: FaIcon(FontAwesomeIcons.solidHeart,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.deepPurple
                                  : Colors.white,
                              semanticLabel: 'Liked',
                              size: 25),
                          onPressed: () {
                            setState(() {
                              _updateFavoriteState(
                                  _favoriteFilms[index].id, false);
                              _favoriteFilms.remove(_favoriteFilms[index]);
                            });
                          }),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(film: _favoriteFilms[index])));
                      }));
            }));
  }
}
