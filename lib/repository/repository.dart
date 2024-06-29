import 'package:dio/dio.dart';
import 'package:tiktok_app/model/feed_response.dart';

class UserRepository {
  final String apiKey =
      "M2hyjkyDW8FLtoU64kLSODPj6rFaTinW6MClA8PzPK1nTFpdiEvalb69"; // API Pexels
  static String mainUrl = "https://api.pexels.com";
  final Dio _dio = Dio();
  var getFeed = '$mainUrl/videos/search';

  Future<FeedResponse> getFeeds() async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "query": "dancing",
      "page": 1,
      "size": "small",
      "orientation ": "portrait"
    };
    try {
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        options.headers["Authorization"] = apiKey;
        _dio.interceptors.requestLock.unlock();
        return handler.next(options);
      }));
      Response response = await _dio.get(getFeed, queryParameters: params);
      return FeedResponse.fromJson(response.data);
    } catch (error) {
      return FeedResponse.withError("$error");
    }
  }
}
