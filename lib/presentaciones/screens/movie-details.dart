import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio2_login/entidades/movie.dart';
import 'package:ejercicio2_login/data/movies.dart';

class MovieDetail extends StatelessWidget {
  final String movieId;

  const MovieDetail({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    final movie = movieList.firstWhere((element) => element.id == movieId);

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Detail')),
      body: _MovieView(movie: movie),
    );
  }
}

class _MovieView extends StatelessWidget {
  final Movie movie;

  const _MovieView({super.key, required this.movie});
  
  get options => null;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        movie.photos != null && movie.photos!.isNotEmpty
    ? CarouselSlider(
        options: CarouselOptions(
          height: 300,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          viewportFraction: 0.9,
        ),
        items: movie.photos!.map((photoUrl) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(photoUrl, fit: BoxFit.cover, width: double.infinity),
          );
        }).toList(),
      )
    : const Icon(Icons.movie),
        const SizedBox(height: 16),
        Text(movie.title, style: textStyle.titleLarge),
        Text(movie.director, style: textStyle.titleMedium),
        Text(movie.year.toString(), style: textStyle.titleSmall),
      ],
    );
  }
}
