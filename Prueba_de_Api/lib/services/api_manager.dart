import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:newpro/constants/strings.dart";
import 'package:newpro/models/graphmodel.dart';
class API_Manager {

  Future <GraphModel> getGraph() async {
    var client = http.Client();
    var graphModel=null;

try{
    var response = await client.get(Strings.graph_url);
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