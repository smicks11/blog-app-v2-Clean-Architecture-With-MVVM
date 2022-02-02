import 'package:blog_app_v2/app/di.dart';
import 'package:blog_app_v2/presentation/details/details.dart';
import 'package:blog_app_v2/presentation/home/index.dart';
import 'package:blog_app_v2/presentation/login/login.dart';
import 'package:blog_app_v2/presentation/register/register.dart';
import 'package:blog_app_v2/presentation/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Routes{
  static const String splashRoute = "/splash";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
}

class RouteGenerator{
  static Route<dynamic> getRoute (RouteSettings routeSettings){
    switch (routeSettings.name){
      case Routes.splashRoute :
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.registerRoute :
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.loginRoute :
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.homeRoute :
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.detailsRoute :
        return MaterialPageRoute(builder: (_) => const DetailsView());
      default :
        return unDefinedRoute();
    }
  }

   static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (ctx) => const Scaffold(
      body: Center(
        child: Text("This route is not found!"),
      ),
    ));
  }
}