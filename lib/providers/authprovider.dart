
import 'dart:convert';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
   late String _token;
  late String _userId;
  late String _email;

  bool get isAuth {
    return false;
  }

  String get token {
   
    return _token;
  }


  String get email {
    return _email;
  }

  String get userId {
    return _userId;
  }

  Future<void> changePassword(String password) async {
    String urlSegment = 'setAccountInfo';
    final url =
        Uri.parse('http://127.0.0.1:8001');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            // 'email': _email,
            'idToken': _token,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        print(responseData['error']['message']);
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _email = responseData['email'];
     
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'email': _email,
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> resetPassword(String email) async {
    String urlSegment = 'getOobConfirmationCode';
    final url =
        Uri.parse('https://www.googleapis.com/identitytoolkit/v3/relyingparty/$urlSegment?key=AIzaSyCv-LK3PExh9UYxUm4SqIdAn15QB_HstWs');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'requestType': "PASSWORD_RESET",
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      if (responseData['email'] == email) {
        print("reset code sent");
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> confirmResetPassword(String code, String password) async {
    String urlSegment = 'resetPassword';
    final url =
        Uri.parse('https://partn15QB_HstWs');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'oobCode': code,
            'requestType': "PASSWORD_RESET",
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      if (responseData['email'] != null) {
        print("change password");
        final response2 = await http.post(
          url,
          body: json.encode(
            {
              'oobCode': code,
              'newPassword': password,
            },
          ),
        );
        final responseData2 = json.decode(response2.body);
        if (responseData2['error'] != null) {
          throw HttpException(responseData2['error']['message']);
        }
        _token = responseData2['refreshToken'];
        notifyListeners();
        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode(
          {
            'token': _token,
            'userId': _userId,
            'email': _email,
          },
        );
        prefs.setString('userData', userData);
      }
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password, String name
      ) async {
    final url =
         Uri.parse('https://127.0.0.1:8001/api/register');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'name': name,
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _email = responseData['email'];
     


      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userId,
          'email': _email,
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
     
    final url =
        Uri.parse('http://10.0.2.2:8001/api/login');
    try {
     
    /*  final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
          },
        ),
      );
       print(url);
      final responseData = json.decode(response.body);
       print(response);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['id'];
      _email = responseData['email'];
      */
       _token = "responseData['idToken']";
      _userId = "1";
      _email = email;
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': 1,
          'email': _email,
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();

    if (!prefs.containsKey('userData')) {
      return false;
    }
   // final extractedUserData =
   //     json.decode(prefs.getString('userData')) as Map<String, Object>;
  _token = "extractedUserData['token']";
    _userId = "extractedUserData['userId']";
    _email = "extractedUserData['email']";
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    print("expired buda muApp");
  }
}
 