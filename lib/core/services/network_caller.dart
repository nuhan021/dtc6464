import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';

import '../models/response_data.dart';
import '../services/storage_service.dart';

class NetworkCaller {
  final int timeoutDuration = 10;
  static bool _isRefreshing = false;

  // GET method
  Future<ResponseData> getRequest(String url, {String? token}) async {
    log('GET Request: $url');
    log('GET Token: $token');
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: {
          'Authorization': token.toString(),
          'Content-type': 'application/json',
        },
      ).timeout(
        Duration(seconds: timeoutDuration),
      );

      // Handle 401 - Unauthorized
      if (response.statusCode == 401) {
        return await _handleUnauthorized(
              () => getRequest(url, token: StorageService.accessToken),
        );
      }

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // POST method
  Future<ResponseData> postRequest(String url,
      {Map<String, String>? body, String? token}) async {
    log('POST Request: $url');
    log('Request Body: ${jsonEncode(body)}');

    try {
      final Response response = await post(
        Uri.parse(url),
        headers: {
          'Authorization': token.toString(),
          'Content-type': 'application/json',
        },
        body: jsonEncode(body),
      ).timeout(Duration(seconds: timeoutDuration));

      // Handle 401 - Unauthorized
      if (response.statusCode == 401) {
        return await _handleUnauthorized(
              () => postRequest(url, body: body, token: StorageService.accessToken),
        );
      }

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // Handle 401 Unauthorized - Refresh token and retry
  Future<ResponseData> _handleUnauthorized(
      Future<ResponseData> Function() retryRequest) async {
    // Prevent multiple simultaneous refresh attempts
    if (_isRefreshing) {
      await Future.delayed(Duration(milliseconds: 500));
      return await retryRequest();
    }

    _isRefreshing = true;

    try {
      final refreshToken = StorageService.refreshToken;

      if (refreshToken == null || refreshToken.isEmpty) {
        log('No refresh token available');
        await _navigateToLogin();
        return ResponseData(
          isSuccess: false,
          statusCode: 401,
          responseData: '',
          errorMessage: 'Session expired. Please login again.',
        );
      }

      // TODO: Replace with your actual refresh token endpoint
      final refreshResponse = await post(
        Uri.parse('YOUR_REFRESH_TOKEN_API_ENDPOINT'),
        headers: {'Content-type': 'application/json'},
        body: jsonEncode({'refreshToken': refreshToken}),
      ).timeout(Duration(seconds: timeoutDuration));

      log('Refresh Token Response: ${refreshResponse.statusCode}');

      if (refreshResponse.statusCode == 200) {
        final decodedResponse = jsonDecode(refreshResponse.body);

        // Extract new tokens - adjust keys based on your API response
        final newAccessToken = decodedResponse['data']?['accessToken'];
        final newRefreshToken = decodedResponse['data']?['refreshToken'];

        if (newAccessToken != null) {
          // Save new tokens
          await StorageService.saveTokens(
            accessToken: newAccessToken,
            refreshToken: newRefreshToken ?? refreshToken,
            userId: StorageService.userId ?? '',
          );

          log('Token refreshed successfully');
          _isRefreshing = false;

          // Retry the original request with new token
          return await retryRequest();
        }
      } else if (refreshResponse.statusCode == 401) {
        // Refresh token is also invalid
        log('Refresh token expired');
        await _navigateToLogin();
        return ResponseData(
          isSuccess: false,
          statusCode: 401,
          responseData: '',
          errorMessage: 'Session expired. Please login again.',
        );
      }

      // If refresh failed for other reasons
      _isRefreshing = false;
      return ResponseData(
        isSuccess: false,
        statusCode: refreshResponse.statusCode,
        responseData: '',
        errorMessage: 'Failed to refresh session. Please login again.',
      );
    } catch (e) {
      log('Refresh token error: $e');
      _isRefreshing = false;
      await _navigateToLogin();
      return ResponseData(
        isSuccess: false,
        statusCode: 401,
        responseData: '',
        errorMessage: 'Session expired. Please login again.',
      );
    }
  }

  // Navigate to login screen
  Future<void> _navigateToLogin() async {
    await StorageService.logoutUser();
    // TODO: Add your navigation logic here
    // Example: Get.offAllNamed('/login');
  }

  // Handle response
  ResponseData _handleResponse(Response response) {
    log('Response Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (decodedResponse['success'] == true) {
        return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: '',
        );
      } else {
        return ResponseData(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          errorMessage: decodedResponse['message'] ?? 'Unknown error occurred',
        );
      }
    } else if (response.statusCode == 400) {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        errorMessage: _extractErrorMessages(decodedResponse['errorSources']),
      );
    } else if (response.statusCode == 500) {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: '',
        errorMessage:
        decodedResponse['message'] ?? 'An unexpected error occurred!',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        errorMessage: decodedResponse['message'] ?? 'An unknown error occurred',
      );
    }
  }

  // Extract error messages for status 400
  String _extractErrorMessages(dynamic errorSources) {
    if (errorSources is List) {
      return errorSources
          .map((error) => error['message'] ?? 'Unknown error')
          .join(', ');
    }
    return 'Validation error';
  }

  // Handle errors
  ResponseData _handleError(dynamic error) {
    log('Request Error: $error');

    if (error is ClientException) {
      return ResponseData(
        isSuccess: false,
        statusCode: 500,
        responseData: '',
        errorMessage: 'Network error occurred. Please check your connection.',
      );
    } else if (error is TimeoutException) {
      return ResponseData(
        isSuccess: false,
        statusCode: 408,
        responseData: '',
        errorMessage: 'Request timeout. Please try again later.',
      );
    } else {
      return ResponseData(
        isSuccess: false,
        statusCode: 500,
        responseData: '',
        errorMessage: 'Unexpected error occurred.',
      );
    }
  }
}