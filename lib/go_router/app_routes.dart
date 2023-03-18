import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/extensions/extensions.dart';
import 'package:flutter_web/screens/first_screen/first_screen.dart';
import 'package:flutter_web/screens/fourth_screen/fourth_screen.dart';
import 'package:flutter_web/screens/second_screen/second_screen.dart';
import 'package:flutter_web/screens/third_screen/third_screen.dart';
import 'package:go_router/go_router.dart';
import '../../not_found_page.dart';
import '../home/home_page.dart';
import '../screens/user_input.dart';
import 'app_routes_constants.dart';



class MyAppRouters{

  GoRouter returnRouter(bool isAuth){
    GoRouter router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          name: AppRouteNames.userInputRouteName,
          builder: (BuildContext context, GoRouterState state) {
            return  UserInput();
          },
        ),
        GoRoute(
            path: '/home',
            name: AppRouteNames.homeRouteName,
            builder: (BuildContext context, GoRouterState state) {
              return  HomePage(workMode: state.queryParams['workMode'],);
            }
        ),
        GoRoute(
            path: '/first',
            name: AppRouteNames.firstRouteName,
            builder: (BuildContext context, GoRouterState state) => FirstScreen( firstScreenName:state.queryParams['username'],)
        ),
        GoRoute(
            path: '/second',
            name: AppRouteNames.secondRouteName,
            builder: (BuildContext context, GoRouterState state) => SecondScreen(data: state.extra as UserData,)
        ),
        GoRoute(
            path: '/third',
            name: AppRouteNames.thirdRouteName,
            builder: (BuildContext context, GoRouterState state) => ThirdScreen()
        ), GoRoute(
            path: '/fourth',
            name: AppRouteNames.fourthRouteName,
            builder: (BuildContext context, GoRouterState state) => FourthScreen()
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) => const NotFoundPage(),
      errorPageBuilder: (BuildContext context, GoRouterState state) =>  const MaterialPage(child: NotFoundPage()),
      redirect: (context,state){
        if(!isAuth &&
            state.location
                .startsWith('/${AppRouteNames.firstRouteName}')){
        return context.namedLocation(AppRouteNames.fourthRouteName);
        }else{
          return null;
        }
      }
    );
    return router;
  }


}
