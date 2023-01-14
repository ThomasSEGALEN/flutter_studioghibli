import 'package:flutter/material.dart';

import '../../models/film.dart';
import '../../repositories/film_repository.dart';
import 'film_details.dart';

class FilmListPage extends StatefulWidget {
  const FilmListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  FilmListPageState createState() => FilmListPageState();
}

class FilmListPageState extends State<FilmListPage> {
  late Future<List<Film>> futureFilms;

  @override
  void initState() {
    super.initState();
    futureFilms = fetchAllFilm();
  }

  Widget createListView(List<Film> films) {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FilmDetailsPage(
                  film: films[index],
                ),
              ),
            );
          },
          child: Card(
            elevation: 1,
            child: Column(
              children: <Widget>[
                Text(
                  films[index].title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  films[index].producer,
                  style: const TextStyle(
                      fontSize: 20, fontStyle: FontStyle.italic),
                ),
                Text(
                  films[index].releaseDate,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider()
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Film>>(
        future: futureFilms,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Film>? films = snapshot.data;
            return createListView(films!);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
