import 'package:flutter/material.dart';
import '../client_bloc.dart';
import 'package:provider/provider.dart';
import '../CodePinPage.dart';


import 'package:flutter_app/models/pro.dart';
import 'package:flutter_app/pro/EmployeePhoto.dart';
import 'package:flutter_app/pro/Prestation.dart';

class ProPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> {
  Pro pro;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientBloc>(
      builder: (_, ClientBloc bloc, __) {
        pro = bloc.pro;

        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            backgroundColor: Colors.orange,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => WorkerSection()),
                );
              })
            ],
            title: Text('APP'),
          ),
          body: SafeArea(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 25.0,
                        left: 25.0,
                        right: 25.0
                    ),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Sélectionner un professionnel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: MediaQuery.of(context).size.width / 2.1,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: pro.employees.length,
                              itemBuilder: (context, i) {
                                return EmployeeWidget(pro.employees[i]);
                              }
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    child: Column(
                        children: _buildPrestations()
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: DisplayPrice(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.all(10.0),
                        child: ConfirmButton(),
                      ),

                    ],
                  )
                ],
              )),
        );
      },
    );
  }

  List<Widget> _buildPrestations() {
    List<Widget> prestations = [];

    pro.prestations.forEach((prestation) {
      prestations.add(PrestationWidget(prestation));
    });

    return prestations;
  }
}

class DisplayPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Selector<ClientBloc, double>(
      selector: (_, ClientBloc bloc) => bloc.price,
      builder: (_, double price, __) {
        return Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "${price.toString()} €",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        );
      }
    );
  }
}

class ConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ClientBloc bloc = Provider.of<ClientBloc>(context);

    if (bloc.selectedEmployee != null && bloc.price > 0) {
      return RaisedButton(
        onPressed: () {},
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