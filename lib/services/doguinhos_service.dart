import 'dart:convert';
import 'dart:io';

import 'package:doguinhos/models/doguinhos_model.dart';
import 'package:http/http.dart' as http;

class DoguinhosService {
  final url = 'https://dog.ceo/api/breed/chihuahua/images';

  Future<DoguinhosModel> fetchDoguinhos([http.Client? client]) async {
    client ??= http.Client();
    try {
      final response = await client.get(Uri.parse(url));

      switch (response.statusCode) {
        case 200: 
          final doguinhos = DoguinhosModel.fromJson(jsonDecode(response.body));
          return doguinhos;
        case 400:
          throw Exception("Bad Request");
        case 401:
          throw Exception("Unauthorized");
        case 500:
          throw Exception("Internal Server Error");
        default:
          throw Exception("Something went wrong");
      }
    } on SocketException {
        throw Exception("No Internet Access");
    } on FormatException {
        throw Exception("Bad Response");
    } catch (e) {
        throw Exception("Unable to fetch API. Exception: $e");
    }
  }
}