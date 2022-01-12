import 'package:flutter/material.dart';
import "package:newpro/models/graphmodel.dart";
import 'package:newpro/services/api_manager.dart';


class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<GraphModel> _graphModel;
  
  @override 
  void initState(){
    _graphModel = API_Manager().postGraph();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text ("OpenSiembro" ),
      ),

      body:Container(
        child: FutureBuilder<GraphModel>(
          future: _graphModel,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                // aqui en la siquiente linea luego de snapshot data. (nombre de el item que me mande la lambda ,osea la llave de la list o json que venga)
                  itemCount: snapshot.data.items.length,
                  itemBuilder:(context,index){
                  // aqui luego de data lo mismo que el comentario anterior sequido [index]
                    var item =snapshot.data.items[index];
                    return Container(
                      height: 100,
                      child:Row(
                        children:<Widget>[
                          Text(item.datetime),
                          Container(
                        child:MaterialButton(
                          minWidth: 200.0,
                          height: 40.0,
                          // aqui debe ir el metodo post en el on pressed
                          onPressed: _graphModel() {},
                          color: Colors.lightBlue,
                          child: Text('Submit', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                        ],
                      ),
                    );
                  });
            }else 
              return Center(child: CircularProgressIndicator()) ;
          },
        ),
      ),
    );
  }
}
