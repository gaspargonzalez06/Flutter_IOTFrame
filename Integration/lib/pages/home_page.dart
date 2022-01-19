// ignore_for_file: unused_field
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';
import "package:newpro/models/graphmodel.dart";
import 'package:newpro/services/api_manager.dart';
import "package:newpro/graph_construct/construct_graph_model.dart";

class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   late Future<List<GraphModel>> _graphModel;
  

  @override 
  void initState(){
    _graphModel = API_Manager().getGraph()  ;
    super.initState();
  }
  String valueChoose="Dev1";
  String valueChoosefecha="2021-09-02";
  List listItem =[
    "Dev1","Dev2","Dev3"
  ];
  List listItemfecha =[
    "2021-09-02","2021-09-05","2021-09-08","2021-09-15"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text ("OpenSiembro" ),
      ),

      body:Container(
        child: FutureBuilder<List<GraphModel>>(
          future: _graphModel,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                // aqui en la siquiente linea luego de snapshot data. (nombre de el item que me mande la lambda ,osea la llave de la list o json que venga)
                  itemCount: snapshot.data!.length,
                  itemBuilder:(context,index){
                  // aqui luego de data lo mismo que el comentario anterior sequido [index]
                    
                    var item =snapshot.data!;
                    return Container(
                      height: 100,
                      child:Row(
                        children:<Widget>[
                          Container(
                             child:SfCartesianChart(
                              series: <ChartSeries>[
                              LineSeries<GraphModel,DateTime>(
                                dataSource: _graphModel ,
                                xValueMapper: (GraphModel graphModel ,_)=>graphModel.datetime,
                                yValueMapper: (GraphModel graphModel, _)=>graphModel.temp)
                            ],
                            primaryXAxis: CategoryAxis(),
                            ),
                            ),
                            Container(
                                child: DropdownButton(
                                  value: valueChoose,
                                  onChanged: (newValue){
                                    setState(() {
                                      valueChoose:newValue;
                                    });

                                },
                                items: listItem.map((valueItem){
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                                ),
                              ),
                              Container(
                                child: DropdownButton(
                                  value: valueChoosefecha,
                                  onChanged: (newValue){
                                    setState(() {
                                      valueChoosefecha:newValue;
                                    });
                                },
                                items: listItemfecha.map((valueItem){
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                                ),
                              ),
                              Container(
                                child:MaterialButton(
                                  minWidth: 200.0,
                                  height: 40.0,
                                  // aqui debe ir el metodo post en el on pressed
                                  onPressed: () {},
                                  color: Colors.lightBlue,
                                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                                )
                              )
                        ],
                      ),
                    );
                  });
            }else 
              return Center(child:CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
