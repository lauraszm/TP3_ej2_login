import 'package:ejercicio2_login/data/movies.dart';
import 'package:ejercicio2_login/entidades/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: _MovieList(movies:movieList),

    );
  }
}

class _MovieList extends StatelessWidget {
  List<Movie> movies;

  _MovieList({
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: movies.length, itemBuilder: (context, index){
      return _MovieItem(movie: movies[index]);
    },
    );
  }
}

class _MovieItem extends StatelessWidget {
  Movie movie;

  _MovieItem({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(movie.title),
        subtitle: Text((movie.director)),
        trailing: const Icon(Icons.arrow_forward),
        leading: movie.poster != null
          ? Image.network(movie.poster!)
          : const Icon(Icons.movie),
        onTap: (){
          context.push('/detail/${movie.id}');
        },
      ),
    );
  }
}