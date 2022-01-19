// ignore_for_file: avoid_init_to_null

import 'dart:convert';

import 'package:http/http.dart' as http;
import "package:newpro/constants/strings.dart";
import 'package:newpro/models/graphmodel.dart';




class API_Manager {

  


  Future<List<GraphModel>> getGraph() async {
    var client = http.Client();
    var graphModel=null;

  try{
    var response = await client.get(Strings.graph_url);
    List<GraphModel> _listado=[];
    
    if(response.statusCode == 200){
      var jsonString = response.body;
      print(response);
      var jsonMap = json.decode(jsonString);
      
      graphModel =GraphModel.fromJson(jsonMap);
    }
}
  catch(Exception) {
  return graphModel;
}

  return graphModel;
  }
}