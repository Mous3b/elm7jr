// import 'package:http/http.dart' as http;
// import 'dart:convert';

// abstract class FailureHttp {
//   final String errorMessage;

//   const FailureHttp(this.errorMessage);
// }

// class ServerFailureHttp extends FailureHttp {
//   ServerFailureHttp(String errorMessage) : super(errorMessage);

//   factory ServerFailureHttp.fromHttpError(http.Response response) {
//     switch (response.statusCode) {
//       case 400:
//         return ServerFailureHttp(response.body);
//       case 401:
//       case 403:
//         return ServerFailureHttp(_parseErrorMessage(response));
//       case 404:
//         return ServerFailureHttp(
//             'Your request was not found. Please try again later.');
//       case 500:
//         return ServerFailureHttp(
//             'Internal Server Error. Please try again later.');
//       default:
//         return ServerFailureHttp(
//             'Oops! An unexpected error occurred. Please try again.');
//     }
//   }

//   static String _parseErrorMessage(http.Response response) {
//     try {
//       // Try to parse error message from response body
//       dynamic jsonBody = jsonDecode(response.body);
//       if (jsonBody != null &&
//           jsonBody is Map &&
//           jsonBody.containsKey('error')) {
//         return jsonBody['error']['message'] ?? 'Unknown Error';
//       }
//     } catch (e) {
//       print('Error parsing response body: $e');
//     }
//     return 'Unknown Error';
//   }
// }
