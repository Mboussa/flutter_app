import 'package:flutter/material.dart';
import 'package:flutter_app/models/employee.dart';
import 'package:provider/provider.dart';

import '../client_bloc.dart';

class EmployeeWidget extends StatelessWidget {
  Employee employee;

  EmployeeWidget(employee) {
    this.employee = employee;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientBloc>(builder: (_, ClientBloc bloc, __) {
      return GestureDetector(
        onTap: () => bloc.selectedEmployee == employee.name
            ? bloc.selectEmployee(null)
            : bloc.selectEmployee(employee.name),
        child: AnimatedOpacity(
            opacity: bloc.selectedEmployee == employee.name ? 1.0 : 0.5,
            duration: Duration(milliseconds: 150),
            child: Column(children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: MediaQuery.of(context).size.width / 3.5,
                  margin: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            employee.photo,
                          ),
                          fit: BoxFit.cover))),
              SizedBox(height: 15.0),
              Text(
                "${employee.name[0].toUpperCase()}${employee.name.substring(1)}",
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                "${employee.waiting.toString()} min",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              )
            ])),
      );
    });
  }
}
