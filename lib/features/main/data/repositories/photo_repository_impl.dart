import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/photo.dart';
import '../../domain/repositories/photo_repository.dart';
import '../datasources/photo_remote_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoRemoteDataSource photoRemoteDataSource;
  PhotoRepositoryImpl({
    required this.photoRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<Photo>>> getAllPhotos() async {
    try {
      final photos = await photoRemoteDataSource.getAllPhotos();
      return right(photos);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
