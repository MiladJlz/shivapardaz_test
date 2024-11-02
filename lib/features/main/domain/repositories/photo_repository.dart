import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/photo.dart';

abstract interface class PhotoRepository {
  Future<Either<Failure, List<Photo>>> getAllPhotos();
}
