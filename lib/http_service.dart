import 'dart:convert';
import 'package:http/http.dart';
class HttpService{
  static String userName = 'Yadeedya';
  late final String respUrl;
  HttpService(String reply){
   respUrl = "http://api.brainshop.ai/get?bid=167106&key=iABJFJf8sP50MTTg&uid=$userName&msg=$reply";
  }
  Future<String> getChatBotReply() async {
    var response = await get(Uri.parse(respUrl));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return data["cnt"];
    }
    else{
      throw 'cant get response';
    }
  }
}