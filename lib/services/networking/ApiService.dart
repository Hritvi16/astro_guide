import 'dart:convert';

import 'package:astro_guide/constants/CommonConstants.dart';
import 'package:astro_guide/controllers/connectivity/ConnectivityController.dart';
import 'package:astro_guide/essential/Essential.dart';
import 'package:astro_guide/services/networking/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:astro_guide/services/networking/BaseProvider.dart';
import 'package:astro_guide/shared/typedef.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  final BaseProvider baseProvider;

  ApiService(this.baseProvider);
  static final storage = GetStorage();

  final ConnectivityController connectivityController = Get.put<ConnectivityController>(ConnectivityController());

  Future<JSON> get<T>({
    required String endpoint,
    JSON? query,
    required String token,
    int cnt = 0,
    int cntf = 0
  }) async {
    try {
      if (connectivityController.isOnline) {
        final response = await baseProvider.get(
            endpoint,
            query: query,
            headers: {ApiConstants.token: token}
        );

        if (response == null) {
          Future.delayed(Duration(seconds: 3), () {});
          if (cntf > 3) {
            return {
              "code": -3,
              "status": "Failure",
              "message": "Not Reachable"
            };
          }
          else {
            return await get(endpoint: endpoint,
                token: storage.read("access") ?? CommonConstants.essential,
                query: query,
                cnt: cnt,
                cntf: cntf + 1);
          }
        }

        print(response.body);
        if (response.statusCode == 403) {
          print("403 get");
          Essential.logout();
        }
        else if (response.statusCode == 401) {
          print(cnt);
          Future.delayed(Duration(seconds: 3), () {});
          return await Essential.getNewAccessToken().then((value) async {
            if (value == true) {
              print(cnt);
              if (cnt <= 3) {
                print("helluuuuuu getttt");
                print("storageaccess: get:storage.read(access)");
                print(storage.read("access"));
                // print(await get(endpoint: endpoint, token: token, query: query, cnt: cnt+1));
                return await get(endpoint: endpoint,
                    token: storage.read("access") ?? CommonConstants.essential,
                    query: query,
                    cnt: cnt + 1);
              }
              else {
                print("helluuuuuu logg");
                Essential.logout();
                return response.body is String
                    ? json.decode(response.body)
                    : response.body;
              }
            }
            else {
              print("helluuuuuu logg 2");
              Essential.logout();
              return response.body is String
                  ? json.decode(response.body)
                  : response.body;
            }
          });
        }
        return response.body is String ? json.decode(response.body) : response
            .body;
      }
      return {
        "code": -3,
        "status": "Failure",
        "message": "No Internet Available"
      };
    }
    catch(ex) {
      Future.delayed(Duration(seconds: 3), () {});
      if (cntf > 3) {
        return {
          "code": -3,
          "status": "Failure",
          "message": "Not Reachable"
        };
      }
      else {
        return await get(endpoint: endpoint,
            token: storage.read("access") ?? CommonConstants.essential,
            query: query,
            cnt: cnt,
            cntf: cntf + 1);
      }
    }
  }

  Future<JSON> post<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    bool requiresAuthToken = false,
    required String token,
    int cnt = 0,
    int cntf = 0
  }) async {


    try {
    if(connectivityController.isOnline) {
      final response = await baseProvider.post(
          endpoint,
          body,
          query: query,
          headers: {ApiConstants.token: token}
      );

      if (response == null) {
          Future.delayed(Duration(seconds: 3), () {});
          if (cntf > 3) {
            return {
              "code": -3,
              "status": "Failure",
              "message": "Not Reachable"
            };
          }
          else {
            return await post(endpoint: endpoint,
                token: token,
                body: body,
                query: query,
                cnt: cnt,
                cntf: cntf + 1);
          }
        }

        print("response.statusCode");
        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 403) {
          print("403 post");
          Essential.logout();
        }
        else if (response.statusCode == 401) {
          print(cnt);
          await Future.delayed(const Duration(seconds: 3), () async {

          });
          return await Essential.getNewAccessToken().then((value) async {
            if (value == true) {
              print(cnt);
              if (cnt <= 3) {
                print("helluuuuuu posttttt");
                print("storageaccess: get:storage.read(access)");
                print(storage.read("access"));
                // print(await post(endpoint: endpoint, token: storage.read("access")??CommonConstants.essential, body: body, query: query, cnt: cnt+1));
                return await post(endpoint: endpoint,
                    token: storage.read("access") ?? CommonConstants.essential,
                    body: body,
                    query: query,
                    cnt: cnt + 1);
              }
              else {
                print("helluuuuuu posttttt loggg");
                Essential.logout();
                return response.body is String
                    ? json.decode(response.body)
                    : response.body;
              }
            }
            else {
              print("helluuuuuu posttttt loggg 2");
              Essential.logout();
              return response.body is String
                  ? json.decode(response.body)
                  : response.body;
            }
          });
        }

        return response.body is String ? json.decode(response.body) : response
            .body;
      }
      return {
        "code": -3,
        "status": "Failure",
        "message": "No Internet Available"
      };
    }
    catch(ex) {
      Future.delayed(Duration(seconds: 3), () {});
      if (cntf > 3) {
        return {"code": -3, "status": "Failure", "message": "Not Reachable"};
      }
      else {
        return await post(endpoint: endpoint,
            token: token,
            body: body,
            query: query,
            cnt: cnt,
            cntf: cntf + 1);
      }
    }
  }

  Future<JSON> file<T>({
    required String endpoint,
    required FormData body,
    JSON? query,
    bool requiresAuthToken = false,
    required String token
  }) async {

    final response = await baseProvider.post(
        endpoint,
        body,
        headers: {ApiConstants.token : token},
        query: query
    );

    if(response==null) {
      return {"code" : -3, "status" : "Failure", "message" : "Not Reachable"};
    }

    print(response.body);

    return response.body is String ? json.decode(response.body) : response.body;
  }

  Future<JSON> put<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    bool requiresAuthToken = false,
  }) async {

    final response = await baseProvider.put(
      endpoint,
      body,
      query: query
    );

    return json.decode(response.body);
  }
  
  Future<JSON> delete<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    bool requiresAuthToken = false,
  }) async {

    final response = await baseProvider.delete(
      endpoint,
      query: query
    );

    return json.decode(response.body);
  }
}
