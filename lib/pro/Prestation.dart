import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app/models/prestation.dart';
import '../client_bloc.dart';


class PrestationWidget extends StatefulWidget {
  Prestation prestation;

  PrestationWidget(prestation) {
    this.prestation = prestation;
  }

  @override
  State<PrestationWidget> createState() => _PrestationState();
}

class _PrestationState extends State<PrestationWidget> {
  ClientBloc bloc;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    bloc = Provider.of<ClientBloc>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          if (selected) {
            bloc.setPrice(bloc.price + widget.prestation.price);
          } else {
            bloc.setPrice(bloc.price - widget.prestation.price);
          }
        });
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
              color: selected ? Colors.brown[100] : Colors.grey[100],
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 25.0,
              bottom: 25.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.prestation.name,
                      style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      "${widget.prestation.time.toString()} min",
                      style: TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
                Text(
                  "${widget.prestation.price.toString()} €",
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                )
              ],
            ),
          )
      ),
    );
  }
}