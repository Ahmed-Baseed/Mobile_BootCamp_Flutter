import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/model/movieDetails.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/homePage.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/introPage.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/paymentPage.dart';
import 'package:mobile_bootcamp_flutter/day_32_movieUI_exercise/features/view/watchList.dart';



class RouteManager{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':{return MaterialPageRoute(builder: (ctx){
        return IntroPage();

      });

      }
      case '/watchList':{
        List<MovieDetails> mc=settings.arguments as  List<MovieDetails>;
        return MaterialPageRoute(builder: (ctx){
          return WatchList(mc: mc,);

        });
      }
      case '/payment':{return MaterialPageRoute(builder: (ctx){
        return PaymentPage();

      });

      }
      default:{
        return MaterialPageRoute(builder: (ctx){
          return  HomePage();

        });}
    }
  }
}
