import 'package:flutter/material.dart';

import '../../domain/entities/photo.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class PhotoLoading extends PhotoState {}

final class PhotoFailure extends PhotoState {
  final String error;
  PhotoFailure(this.error);
}

final class PhotosDisplaySuccess extends PhotoState {
  final List<Photo> photos;
  final bool hasReachedMax;
  PhotosDisplaySuccess(this.photos, this.hasReachedMax);
}
