import 'package:app_boilerplate/constants/base_urls.dart';
import 'package:app_boilerplate/platform/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiClient {
  static final Logger _logger = Logger(printer: PrettyPrinter(colors: true, printEmojis: true));
  static final Dio client = Dio(
    BaseOptions(
      baseUrl: BaseUrl.dev,
    ),
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) => _requestInterceptor(options, handler),
      onResponse: (Response response, ResponseInterceptorHandler handler) => _responseInterceptor(response, handler),
      onError: (DioError e, ErrorInterceptorHandler handler) => _onErrorInterceptor(e, handler)));

  static _requestInterceptor(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d('------------->');
    _logger.d('\nMethods: ${options.method}');
    _logger.d('\nPath: ${options.path}');
    _logger.d('\nData: ${options.data}');
    return handler.next(options);
  }

  static _responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    _logger.d('------------->');
    _logger.d('\nResponse: ${response.data}');
    return handler.next(response);
  }

  static _onErrorInterceptor(DioError e, ErrorInterceptorHandler handler) {
    _logger.e('------------->');
    _logger.e('\nError: ${e.response}');
    return handler.next(e);
  }

  // Future<List<PostModel>> getPosts(String postTypes) async {
  //   Map<String, dynamic> queryString = {'boardTypes': postTypes};
  //
  //   List<PostModel> postList = [];
  //
  //   Response postListData = await client.get('/services/board/api/posts/list', queryParameters: queryString);
  //
  //   postListData.data.forEach((post) {
  //     postList.add(PostModel.fromJson(post));
  //   });
  //
  //   return postList;
  // }
}
