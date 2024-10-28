import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app_clone/domain/entities/song/song.dart';
import 'package:spotify_app_clone/presentation/home/bloc/news_songs_cubit.dart';
import 'package:spotify_app_clone/presentation/home/bloc/news_songs_state.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
          builder: (context, state) {
            if (state is NewsSongsLoading) {
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
            if (state is NewsSongsLoaded) {
              return _songs(
                state.songs,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column();
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 14,
      ),
      itemCount: 2,
    );
  }
}
