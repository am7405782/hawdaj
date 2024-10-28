// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ServerError implements Exception {
  int? _errorCode;
  final String _errorMessage = "";

  ServerError.withError({error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioException error) {
    // for any null toast
    if (error.response!.statusCode == 500) {
      return Fluttertoast.showToast(
          msg: "حدث خطأ ما.. يرجي المحاولة في وقت لاحق");
    }
    if (error.response!.statusCode == 401 ||
        error.response!.statusCode == 400 ||
        error.response!.statusCode == 422) {
      return Fluttertoast.showToast(
          msg: error.response!.data['msg'] ??
              error.response!.data['message'] ??
              "Error Try again");
    } else if (error.type == DioExceptionType.badResponse) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(
          msg: error.response!.data['msg'].toString());
    } else if (error.type == DioExceptionType.unknown) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(
          msg: error.response!.data['msg'].toString());
    } else if (error.type == DioExceptionType.cancel) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(msg: 'Request was cancelled');
    } else if (error.type == DioExceptionType.connectionError) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(
          msg: 'Connection failed. Please check internet connection');
    } else if (error.type == DioExceptionType.connectionTimeout) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(msg: 'Connection timeout');
    } else if (error.type == DioExceptionType.badCertificate) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(msg: '${error.response!.data['msg']}');
    } else if (error.type == DioExceptionType.receiveTimeout) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(msg: 'Receive timeout in connection');
    } else if (error.type == DioExceptionType.sendTimeout) {
      if (kDebugMode) {
        print(error.response!.data['msg'].toString());
      }
      return Fluttertoast.showToast(msg: 'Receive timeout in send request');
    }
    return _errorMessage;
  }
}
