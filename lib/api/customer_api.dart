part of 'apis.dart';

class CustomerApi {
  // * USER LOGIN API
  static Future<CustomerApiResponse> login(
      String email, String password) async {
    Customer? customer;

    // SET API URL
    Uri uri = Uri.http(apiURL, apiPath + 'login');

    final response =
        await http.post(uri, body: {'email': email, 'password': password});

    if (response.statusCode != 200) {
      return CustomerApiResponse(
          message: 'Oops, something went wrong', status: 'error');
    }

    final data = jsonDecode(response.body);
    customer = Customer.fromJson(data);

    // * STORE USER TOKEN TO SHARED PREFERENCES
    await storeUserToken(customer.data?.token);

    return CustomerApiResponse(
        customer: customer, message: customer.meta?.message);
  }

  //* GET USER DETAILS DATA
  static Future getUserData() async {
    Meta? meta;
    String? token = await getUserToken();
    Uri uri = Uri.http(apiURL, apiPath + 'customer/show');

    final response = await http.get(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode != 200) {
      return CustomerApiResponse(
          message: 'Oops, something went wrong', status: 'error');
    }
    final data = jsonDecode(response.body)['meta'];
    meta = Meta.fromJson(data);

    return CustomerApiResponse(message: meta.message);
  }

  //* USER LOGOUT
  static Future<CustomerApiResponse> logout() async {
    Meta? meta;
    String? token = await getUserToken();
    Uri uri = Uri.http(apiURL, apiPath + 'customer/logout');

    final response = await http.post(uri, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode != 200) {
      return CustomerApiResponse(
          message: 'Oops, something went wrong', status: 'error');
    }

    final data = jsonDecode(response.body)['meta'];
    meta = Meta.fromJson(data);

    return CustomerApiResponse(message: meta.message, status: 'success');
  }

  //* STORE USER TOKEN TO SHARED PREFERENCES
  static Future<String?> storeUserToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token!);
  }

  //* GET USER TOKEN FROM SHARED PREFERENCES
  static Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');
    return token;
  }

  //* DESTROY USER TOKEN FROM SHARED PREFERENCES
  static Future<String> destroyUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
    return 'Succesfully revoked token';
  }
}

class CustomerApiResponse {
  final Customer? customer;
  final String? message;
  final String status;

  CustomerApiResponse({this.customer, this.message, this.status = 'success'});
}
