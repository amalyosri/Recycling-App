import 'package:flutter/material.dart';

import '../constant.dart';
import 'delivery_address_details.dart';
import 'delivery_address_details.dart';

class taskScreen extends StatelessWidget{
  @override
  

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Task"),),

      body: Column(
        children: [
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context,int index){
                return
                    ListTile(
                      subtitle:Text(customeraddress[index]),
                      trailing: Icon(Icons.arrow_forward_ios),
                      title:Text(customername[index],style:TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                      onTap:(){ Navigator.push(
                       context,
                         MaterialPageRoute(builder: (context) =>  deliverydetils()),
                      );}
                      
                      );
              }
              ),
          ),

             RaisedButton(
               color: Colors.green,
                  child: Text("log out",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    //  Navigator.push(
                    //   context,
                    //     MaterialPageRoute(builder: (context) =>  deliverydetils()),
                    //  );
                  })
        ],
      ),
    );
  }
}