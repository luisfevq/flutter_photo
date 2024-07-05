import 'dart:convert';
import 'dart:io';

import 'package:omniprotest/core/exceptions.dart';
import 'package:omniprotest/core/status_code.dart';
import 'package:omniprotest/data/datasource/photo_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:omniprotest/data/model/photo_model.dart';

class PhotoApiImpl implements PhotoDatasource {
  final http.Client _httpService;

  PhotoApiImpl(this._httpService);

  @override
  Future<List<PhotoModel>> getPhotos({required int page}) async {
    try {
      final uri = Uri.parse(
          'https://jsonplaceholder.typicode.com/photos?_page=$page&_limit=10');
      final response = await _httpService.get(uri);
      if (StatusCode.isValidHttpCode(response.statusCode)) {
        final List<dynamic> body = jsonDecode(response.body);
        return List.from(body).map((e) => PhotoModel.fromJson(e)).toList();
      }
      throw ServerException(
        error: response.body,
        statusCode: response.statusCode,
      );
    } on HttpException catch (e) {
      throw ServerException(
        error: e.message,
        statusCode: 0,
      );
    } catch (e) {
      throw Exception();
    }
  }
}
