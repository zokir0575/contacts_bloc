import 'dart:convert';
import 'package:http/http.dart';
import '../model/post_model.dart';

class Network{
  static String BASE = "61cda3fd7067f600179c5b68.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json'};


  /* Http Apis */


  static String API_LIST = "/contacts";
  static String API_CREATE = "/contacts";
  static String API_UPDATE = "/contacts/"; //{id}
  static String API_DELETE = "/contacts/"; //{id}

  /* Http Request*/

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'fullname': post.fullname,
      'mobile': post.mobile,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'id': post.id,
      'fullname': post.fullname,
      'mobile': post.mobile,
    });
    return params;
  }

  /* HTTP Parsing */
  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
  static Post parsePost(String response) {
    dynamic json = jsonDecode(response);
    var data = Post.fromJson(json);
    return data;
  }
 }