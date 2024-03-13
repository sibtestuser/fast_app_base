// import 'package:dio/dio.dart';
// import 'package:mock_web_server/mock_web_server.dart';
// import 'package:test/test.dart';

void main() {
  // final _server = MockWebServer();
  //
  // setUp(() async {
  //   await _server.start();
  //   final dio = Dio();
  //   dio.interceptors.add(LogInterceptor(responseBody: true));
  //
  // });
  //
  // tearDown(() {
  //   _server.shutdown();
  // });
  //
  // test('Test Dio GET request', () async {
  //   final dio = Dio();
  //   final response = await dio.get('https://jsonplaceholder.typicode.com/posts/1');
  //   expect(response.statusCode, equals(200));
  //   expect(response.data['id'], equals(1));
  // });

  var list = [1, 2, 3];
  var newList = list.map((e) => e + 1);
  print(list);
  print(newList);
  list[0] = 0;
  print(list);
  print(newList);
}
