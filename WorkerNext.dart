import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './client_bloc.dart';

import 'pro/EmployeePhoto.dart';
import 'package:flutter_app/models/pro.dart';



class ClientNext extends StatefulWidget {
  @override
  _ClientNextState createState() => _ClientNextState();
}

class _ClientNextState extends State<ClientNext> {

  Pro pro;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientBloc>(
        builder: (_, ClientBloc bloc, __) {
          pro = bloc.pro;

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 25.0,
                      left: 25.0,
                      right: 25.0
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Container(
                        height: MediaQuery.of(context).size
                            .width / 2.1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: pro.employees.length,
                            itemBuilder: (context, i) {
                              return EmployeeWidget(pro.employees[i]);
                            }
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.all(10.0),
                        child: ConfirmButton2(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
          );
        }
    );
  }
}

class ConfirmButton2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ClientBloc bloc = Provider.of<ClientBloc>(context);

    if (bloc.selectedEmployee != null) {
      return RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ConfirmNext()),
          );
        },
        color: Colors.orange,
        shape: StadiumBorder(),
        child: Text(
          "Confirmer",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0
          ),
        ),
      );
    } else {
      return RaisedButton(
          onPressed: null,
          color: Colors.grey,
          shape: StadiumBorder()
      );
    }
  }
}

class ConfirmNext extends StatefulWidget {
  @override
  _ConfirmNextState createState() => _ConfirmNextState();
}

class _ConfirmNextState extends State<ConfirmNext> {

  Pro pro;
  int _i = 0;

  void _incrementCounter() {
    setState(() {

      _i++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ClientBloc>(
        builder: (_, ClientBloc bloc, __) {
          pro = bloc.pro;

          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Card(
                        child: Text(
                          '$_i',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 75,
                          ),
                        ),
                      ),
                      FlatButton(onPressed: (){
                        _incrementCounter();
                      }, child: Card(
                        child: Text('Suivant !'),
                      ))
                    ],
                  ),
                ),
            ),
          );
        }
      );
    }
}
