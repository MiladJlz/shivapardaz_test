import 'package:flutter/material.dart';

@immutable
sealed class PhotoEvent {}

final class PhotoFetchAllPhotos extends PhotoEvent {}

final class PhotoFetchMorePhotos extends PhotoEvent {}
