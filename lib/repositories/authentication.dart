import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:quiz/models/custom_error.dart';
import 'package:quiz/models/user_session.dart';

class AuthenticationRepository {
  final StreamController<UserSession?> _authController =
      StreamController<UserSession?>();
  Stream<UserSession?> get status => _authController.stream;

  Future login({
    required String userName,
    required String password,
  }) async {
    try {
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      );
      if (response.statusCode == 200) {
        const userSession = UserSession(
          id: 'id',
          fullName: 'fullName',
          token: 'token',
        );
        //Stream "authenticated"
        _authController.sink
            .add(userSession);
      } else {
        throw CustomError(
          code: response.statusCode.toString(),
          message: "Message from backend!",
        );
      }
    } on CustomError catch (e) {
      rethrow;
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    _authController.sink.add(null);
  }
}
