import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/photo.dart';
import '../../domain/usecases/get_all_photos.dart';
import 'photo_state.dart';
import 'photo_event.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final GetAllPhotos _getAllPhotos;
  int _currentPage = 0;
  final int _pageSize = 11;
  late final List<Photo> allPhotos;

  PhotoBloc({
    required GetAllPhotos getAllPhotos,
  })  : _getAllPhotos = getAllPhotos,
        super(PhotoInitial()) {
    on<PhotoFetchAllPhotos>(_onFetchAllPhotos);
    on<PhotoFetchMorePhotos>(_onFetchMorePhotos);
  }

  void _onFetchAllPhotos(
    PhotoFetchAllPhotos event,
    Emitter<PhotoState> emit,
  ) async {
    emit(PhotoLoading());
    final res = await _getAllPhotos(NoParams());
    res.fold(
      (l) => emit(PhotoFailure(l.message)),
      (r) {
        allPhotos = r;
        emit(PhotosDisplaySuccess(_getPhotosForPage(_currentPage), r.isEmpty));
      },
    );
  }

  void _onFetchMorePhotos(
    PhotoFetchMorePhotos event,
    Emitter<PhotoState> emit,
  ) async {
    if (state is PhotosDisplaySuccess) {
      try {
        final currentState = state as PhotosDisplaySuccess;
        _currentPage++;
        List<Photo> photos = _getPhotosForPage(_currentPage);
        photos = [...currentState.photos, ...photos];
        emit(PhotosDisplaySuccess(
          photos,
          photos.isEmpty,
        ));
      } catch (e) {
        emit(PhotoFailure(e.toString()));
      }
    }
  }

  List<Photo> _getPhotosForPage(int page) {
    final startIndex = page * _pageSize;
    final endIndex = startIndex + _pageSize;
    if (startIndex >= allPhotos.length) {
      return [];
    }
    return allPhotos.sublist(startIndex, endIndex.clamp(0, allPhotos.length));
  }
}
