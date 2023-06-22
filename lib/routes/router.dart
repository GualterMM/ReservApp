// User endpoints

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

// Restaurant endpoints

Uri listRestaurantsRoute(String host){
  var url = Uri(
    scheme: 'http',
    host: host,
    port: 8000,
    path: 'restaurantes/',
  );

  return url;
}

Uri listRestaurantsByTypeRoute(String host, Map<String, dynamic> params){
  var url = Uri(
    scheme: 'http',
    host: host,
    port: 8000,
    path: 'restaurantes/',
    queryParameters: params,
  );

  return url;
}

Uri listRestaurantByNameRoute(String host, String name){
  var url = Uri(
    scheme: 'http',
    host: host,
    port: 8000,
    path: 'restaurante/$name/',
  );

  return url;
}

Uri listItemsByRestaurant(String host, Map<String, dynamic> params){
  var url = Uri(
    scheme: 'http',
    host: host,
    port: 8000,
    path: 'itemcardapio/',
    queryParameters: params,
  );

  return url;
}