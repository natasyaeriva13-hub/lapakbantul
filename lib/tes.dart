import 'package:flutter/material.dart';

class Tes extends StatelessWidget {   
   const Tes({super.key});

  @override   
  Widget build(BuildContext context) {     
    return MaterialApp(       
      home: Scaffold(         
        appBar: AppBar(title: Text("Contoh Button")),         
        body: Center(           
          child: Column(             
            mainAxisAlignment: MainAxisAlignment.center,             
            children: [
              TextButton(                 
                onPressed: () {},                 
                child: Text("Text Button"),               ),
              ElevatedButton(                 
                onPressed: () {},                 
                child: Text("Elevated Button"),               ),
              OutlinedButton(                 
                onPressed: () {},                 
                child: Text("Outlined Button"),               ),
            ],
          ),
        ),
      ),
    );
  }
}
