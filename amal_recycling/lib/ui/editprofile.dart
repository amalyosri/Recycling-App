import 'package:flutter/material.dart';

class Editprofile extends StatefulWidget {
  

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  @override
  var nameController =TextEditingController();
var phoneController =TextEditingController();
var addressController =TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit your info"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("image/Untitled design.png",height: 300,),
            TextFormField(
                        controller: nameController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value){
                              print(value);
                            },
                            onChanged: (String value){
                              print(value);
                            },
                            decoration: const InputDecoration(
                              // hintText: 'Email Address',
                              labelText: 'name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.account_box_rounded,
                              ),
            
                            ),
            
                          ),
                          
                          const SizedBox(height: 10,),
                                TextFormField(
                        controller: phoneController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value){
                              print(value);
                            },
                            onChanged: (String value){
                              print(value);
                            },
                            decoration: const InputDecoration(
                              // hintText: 'Email Address',
                              labelText: 'phone',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
            
                            ),
            
                          ),
                          const SizedBox(height: 10,),
                         TextFormField(
                        controller: addressController,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value){
                              print(value);
                            },
                            onChanged: (String value){
                              print(value);
                            },
                            decoration: const InputDecoration(
                              // hintText: 'Email Address',
                              labelText: 'address',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.add_location,
                              ),
            
                            ),
            
                          ),
                          const SizedBox(height: 20,),
                          RaisedButton(
                            color: Colors.green,
                            child: const Text("Save change",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            onPressed: (){})
                          
            
          ],),
        ),
      ),
    );
  }
}