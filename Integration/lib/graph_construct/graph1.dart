

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
//import 'package:' as charts;
import 'package:newpro/graph_construct/construct_graph_model.dart';//esta sirve para importar la dependencia del yml de la grafica
class Graph1 extends StatelessWidget{
  const Graph1 ({Key? key}) : super (key: key);

  static List<charts.Series<Graph_Data_Model,String>> _createGraphData(){
    final data = [

    ];
    return [
      //charts.Series<BarModel,String>(
        data: data,
        id:"",
        colorFn:(_,__) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Graph_Data_Model, graph_Data_Model, _) => graph_Data_Model.datetime,
        measureFn:(Graph_Data_Model, graph_Data_Model, _) => graph_Data_Model.temp,

      )
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Graph1"),
      ),
      body:Center(
        child:Container(
          height: 300,
          child: charts.Graph1(
            _createGraphData(),
            animate:false,
          ),
        ) 
      ),
      );
    
  }
}
