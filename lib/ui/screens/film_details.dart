import 'package:flutter/material.dart';

import '../../models/film.dart';

class FilmDetailsPage extends StatefulWidget {
  const FilmDetailsPage({Key? key, required this.film}) : super(key: key);

  final Film film;

  @override
  FilmDetailsState createState() => FilmDetailsState(film);
}

class FilmDetailsState extends State<FilmDetailsPage> {
  Film film;

  FilmDetailsState(this.film);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        film.title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Release date: ${film.releaseDate}",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Producer: ${film.producer}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Director : ${film.director}",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        film.description,
                        style: const TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
