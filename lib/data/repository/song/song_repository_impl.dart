import 'package:dartz/dartz.dart';
import 'package:spotify_app_clone/data/sources/song/song_firebase_service.dart';

import 'package:spotify_app_clone/domain/repository/song/song.dart';
import 'package:spotify_app_clone/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
