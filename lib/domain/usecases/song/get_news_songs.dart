import 'package:dartz/dartz.dart';
import 'package:spotify_app_clone/core/usecase/usecase.dart';
import 'package:spotify_app_clone/data/repository/song/song_repository_impl.dart';
import 'package:spotify_app_clone/service_locator.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImpl>().getNewsSongs();
  }
}
