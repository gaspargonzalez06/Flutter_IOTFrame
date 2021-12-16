import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/datos_Grafica1.dart';

import 'package:http/http.dart' as http;


import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    ) ;
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

//el future ayuda a que el evento reciba una respuesta de un api
  

// variables que se usan al crear las combobox y la grafica
  late List<GDPData> _chartData;
  String valueChoose="Dev1";
  String valueChoosefecha="2021-09-02";
  List listItem =[
    "Dev1","Dev2","Dev3"
  ];
  List listItemfecha =[
    "2021-09-02","2021-09-05","2021-09-08","2021-09-15"
  ];

  
  
  @override
  void initState() {

    _chartData=getChartData();


    super.initState();
    //la siquiente linea se usa junto con la definicon de future para cargar el estado
    //_listadoDatos_Grafica1=_getDatos_Grafica1();
     
     
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body:Column(
          children: [
          Container(
          alignment: Alignment.center,
          width: 600,
          height: 300,
          
          child: SfCartesianChart(
            series: <ChartSeries>[
            LineSeries<GDPData,String>(
              dataSource: _chartData,
              xValueMapper: (GDPData gdp, _)=>gdp.continent,
              yValueMapper: (GDPData gdp, _)=>gdp.gdp)
          ],
          primaryXAxis: CategoryAxis(),
          )
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
          

          
          ],
          )

    );
        
  
  }
}
 List<GDPData> getChartData(){
    final List<GDPData> chartData=[
      GDPData("dia1", 22),
      GDPData("dia2", 21),
      GDPData("dia3", 25),
      GDPData("dia4", 33),
      ];
      return chartData;
  }


class GDPData{
  GDPData(this.continent,this.gdp);
  final String continent;
  final double gdp;
}

