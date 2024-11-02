import "package:get_it/get_it.dart";

import "features/main/data/datasources/photo_remote_data_source.dart";
import "features/main/data/repositories/photo_repository_impl.dart";
import "features/main/domain/repositories/photo_repository.dart";
import "features/main/domain/usecases/get_all_photos.dart";
import "features/main/presentation/bloc/photo_bloc.dart";

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator
    ..registerFactory<PhotoRemoteDataSource>(() => PhotoRemoteDataSourceImpl())
    ..registerFactory<PhotoRepository>(
        () => PhotoRepositoryImpl(photoRemoteDataSource: serviceLocator()))
    ..registerFactory(() => GetAllPhotos(photoRepository: serviceLocator()))
    ..registerLazySingleton(() => PhotoBloc(getAllPhotos: serviceLocator()));
}
