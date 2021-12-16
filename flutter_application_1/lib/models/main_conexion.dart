// esto se anexaria a la parte de la logica de la lambda directo a la grafica luego de presionar los botones 
/*
Future<List<Datos_Grafica1>> _listadoDatos_Grafica1;
  Future<List<Datos_Grafica1>> _getDatos_Grafica1(){
    //await para esperar el api en este caso la lambda
    final response =await http.get("https://urk1fkwcvi.execute-api.us-east-1.amazonaws.com/dev/iotTeamDemoFnc1");
    List<Datos_Grafica1> datos_grafica1=[];

    if(response.statusCode == 200){
      String body= utf8.decode(response.bodyBytes);

      final jsonData =jsonDecode(body);
      //aqui puedo definir que parte del json quiero usando ["nombredato"]["llave"]
      print(jsonData);
      for (var item in jsonData[]){
        // datos de grafica1 ordena la response es una lista donde le das el formato , debe avanzar a query
        datos_grafica1.add(
          Datos_Grafica1(item["nombre_device"],item["temperatura"] )
        )
      }
      return datos_grafica1;


    }else{
      throw Exception("Fallo de coneccion");

    }
    }


  }
@override
  void initState() {
    super.initState();
    //la siquiente linea se usa junto con la definicon de future para cargar el estado
     //_chartData=getChartData();
     //_listadoDatos_Grafica1=_getDatos_Grafica1();
    
  }
*/