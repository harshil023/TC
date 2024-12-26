import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_setup_flutter_getx/utils/api_request_type.dart';

import '../utils/utility.dart';

class NetworkService {
  callRequest(
      {uri,
      params,
      requestType,
      query,
      onNoInternet,
      onError,
      bearerToken}) async {
    if (await Utility.isConnected()) {
      try {
        http.Response? response;
        printf("Request Parameter :" + params.toString());
        switch (requestType) {
          case ApiRequestType.REQUEST_POST:
            Map<String, String> header = {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            };
            String body_params = json.encode(params);
            response = await http.post(uri, body: body_params, headers: header);
            break;
          case ApiRequestType.REQUEST_GET:
            Map<String, String> header = {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $bearerToken',
            };
            response = await http.get(uri, headers: header);
            break;
        }
        printf("Headers :" + response!.headers.toString());
        printf("URL :" + response!.request!.url.toString());
        printf("Response :" + response.body);
        printf("Status Code :" + response.statusCode.toString());

        if (response.statusCode == 200) {
          return response;
        } else {
          if (onError != null) onError(response.body);
          return null;
        }
      } catch (err, log) {
        printf("Error: " + err.toString() + "\n Log" + log.toString());
        return null;
      }
    } else {
      if (onNoInternet != null) onNoInternet();
      return null;
    }
  }
}
