import 'package:dartz/dartz.dart';
import 'package:spotify_app_clone/core/usecase/usecase.dart';
import 'package:spotify_app_clone/domain/repository/song/song.dart';
import 'package:spotify_app_clone/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewsSongs();
  }
}
