import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:newpro/constants/strings.dart";
import 'package:newpro/models/graphmodel.dart';
class API_Manager {

  Future<GraphModel> postGraph() async {
    var client = http.Client();
    var graphModel=null;

  try{
    var response = await client.post(Strings.graph_url ,body: {
        'device_Id':'dev1',
        'datetime':'2021-09-02',
      });
    ;
    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
     
      graphModel =GraphModel.fromJson(jsonMap);
    }
}
  catch(Exception)
{
  return graphModel;
}

  return graphModel;
  }
}