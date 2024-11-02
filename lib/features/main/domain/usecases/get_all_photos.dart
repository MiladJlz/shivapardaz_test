import 'package:fpdart/fpdart.dart';
import 'package:shivapardaz_test/features/main/domain/entities/photo.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/photo_repository.dart';

class GetAllPhotos implements UseCase<List<Photo>, NoParams> {
  final PhotoRepository photoRepository;
  GetAllPhotos({required this.photoRepository});

  @override
  Future<Either<Failure, List<Photo>>> call(params) async {
    return await photoRepository.getAllPhotos();
  }
}
