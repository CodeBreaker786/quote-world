 

import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Column(
            
             children: [
               Expanded(
                                child: Container(
        child: Center(child: Image.asset('assets/internet.gif',fit:BoxFit.fitHeight ,))
      ),
               ),
      Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: MaterialButton(
          
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(20)
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text('Try Again',style: TextStyle(
              fontSize: 20,fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold
            ),),
          ),
          onPressed: (){
          
          Navigator.pop(context);
        }),
      )
             ],
           ),
    );
  }
}