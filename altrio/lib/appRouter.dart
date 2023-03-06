import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AppRouter{

  AppRouter(){}

   Route generateRoute(RouteSettings settings){

     return PageRouteBuilder(
         pageBuilder: (context,animation,secondaryAnimation){
           return Home();
         });

   }






}