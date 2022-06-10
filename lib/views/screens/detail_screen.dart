import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/film.dart';

class DetailScreen extends StatefulWidget {
  final Film film;

  const DetailScreen({Key? key, required this.film}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.film.title),
            leading: IconButton(
                splashColor: Theme.of(context).brightness == Brightness.light
                    ? Colors.deepPurple.shade200
                    : Colors.white38,
                splashRadius: 23,
                iconSize: 25,
                icon: const FaIcon(FontAwesomeIcons.angleLeft),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: ListView(children: [
          Image.network(widget.film.movieBanner),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Card(
                    elevation: 2,
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Column(children: [
                            Text(widget.film.title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(fontSize: 24)),
                            Text(
                                '${widget.film.originalTitleRomanised} • ${widget.film.originalTitle}',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(fontSize: 16)),
                            const Divider(
                                color: Colors.grey, height: 15, thickness: 1),
                            Container(
                                margin:
                                const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(widget.film.description,
                                    style: GoogleFonts.roboto(fontSize: 16)))
                          ])
                        ]))),
                Row(children: [
                  Expanded(
                      child: Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(children: [
                                Text('Director',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16)),
                                Text(widget.film.director,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16)),
                              ])))),
                  Expanded(
                      child: Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(children: [
                                Text('Producer',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16)),
                                Text(widget.film.producer,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16))
                              ]))))
                ]),
                Row(children: [
                  Expanded(
                      child: Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(children: [
                                Text('Release date',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16)),
                                Text(widget.film.releaseDate,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16))
                              ])))),
                  Expanded(
                      child: Card(
                          elevation: 2.0,
                          child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(children: [
                                Text('Running time',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16)),
                                Text('${widget.film.runningTime} minutes',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(fontSize: 16))
                              ]))))
                ])
              ]))
        ]));
  }
}