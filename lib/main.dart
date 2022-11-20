import 'package:flutter/material.dart';
import 'package:pfumamugaba/providers/mukandoprovider.dart';
import 'package:provider/provider.dart';

import 'providers/authprovider.dart';
import 'screens/auth_screen.dart';
import 'screens/mukando_overview.dart';
import 'screens/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
       
       
        
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
              title: 'Pfumamugaba',
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato',
              ),
              home: auth.isAuth
                  ? MukandoOverviewScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? const SplashScreen()
                              : const AuthScreen(),
                    ),
              routes: {
               // ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              },
            ),
      ),
    );
  }
}
