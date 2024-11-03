import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/photo.dart';

@immutable
sealed class PhotoState extends Equatable {
  @override
  List<Object> get props => [];
}

final class PhotoInitial extends PhotoState {}

final class PhotoLoading extends PhotoState {}

final class PhotoFailure extends PhotoState {
  final String error;
  PhotoFailure(this.error);
  @override
  List<Object> get props => [error];
}

final class PhotosDisplaySuccess extends PhotoState {
  final List<Photo> photos;
  PhotosDisplaySuccess(this.photos);
  @override
  List<Object> get props => [photos];
}
