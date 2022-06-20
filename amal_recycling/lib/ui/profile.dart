import 'package:flutter/material.dart';
import 'package:graduation/ui/editprofile.dart';

class Profile extends  StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),

      body:Column(
        children: [
          Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Icon(Icons.account_circle,size: 150,color: Colors.grey,),
              const Text("Hi Ahmed"),
              
              FlatButton(onPressed: (){
                Navigator.push(
                           context,
                             MaterialPageRoute(builder: (context) =>  Editprofile()),
                          );
              }, child: const Text("edit your info", style: TextStyle(color: Colors.green),)),
              const Text("your point",style: TextStyle(color: Colors.green,fontSize: 20),),
              Container(
                margin: EdgeInsets.all(18),
                height: 40,
                width: 76,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Colors.green,
                ),
                child: const Center(
                  child: Text("400", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  textAlign: TextAlign.center,
                  ),
                ),),

             
              const Text("Recycle more and save the planet!",style: TextStyle(color: Colors.grey,fontSize: 20),),
              const SizedBox(height: 30,),
              const Align(alignment: Alignment.centerLeft,
              child: Text("    ADDRESS", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              )

            ],),
          ),
        
        ],
      ) ,
    );

  }
}