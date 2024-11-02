import 'package:dio/dio.dart';
import 'package:shivapardaz_test/core/constants/constants.dart';

import '../../../../core/error/exceptions.dart';
import '../models/photo_model.dart';

abstract interface class PhotoRemoteDataSource {
  Future<List<PhotoModel>> getAllPhotos();
}

class PhotoRemoteDataSourceImpl implements PhotoRemoteDataSource {
  final dio = Dio();

  @override
  Future<List<PhotoModel>> getAllPhotos() async {
    try {
      final response = await dio.get(Constants.baseURL);
      final photos = (response.data as List)
          .map((blog) => PhotoModel.fromJson(blog))
          .toList()
          .cast<PhotoModel>();

      return photos;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
