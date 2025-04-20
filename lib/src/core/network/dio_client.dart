import 'package:dio/dio.dart';
import 'package:e_com_task/src/core/network/api_endpoints.dart';

class DioClient {
  static const commonHeader = {"Content-Type": "application/json", "accept": "application/json"};

  final Dio dio;

  DioClient(this.dio) {
    dio.options = BaseOptions(baseUrl: ApiEndpoints.baseUrl, headers: commonHeader);
  }
}
