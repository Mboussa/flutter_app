import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/pro.dart';
import 'client_bloc.dart';
import 'pro/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ClientBloc bloc = ClientBloc();
    Pro pro = Pro("Elite coiffeur", 15);
    bloc.setPro(pro);

    return ChangeNotifierProvider<ClientBloc>(
      builder: (_) => bloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProPage()
      )
    );
  }
}