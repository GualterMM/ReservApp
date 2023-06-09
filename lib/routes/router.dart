// User endpoints
import 'package:flutter/cupertino.dart';

Uri userLoginRoute(String host, Map<String, dynamic> params){
  var url = Uri(
    scheme: 'http',
    host: host,
    port: 8000,
    path: 'usuarios/',
    queryParameters: params,
  );

  return url;
}

Uri userRegisterRoute(String host){
  var url = Uri(
    scheme: 'http',
    host: host,
    port: 8000,
    path: 'usuarios/',
  );

  return url;
}
