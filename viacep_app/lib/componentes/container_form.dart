import 'package:flutter/material.dart';
import 'package:viacep_app/blocs/cep_bloc.dart';
import 'package:viacep_app/componentes/hexadecimal_color.dart';

class ContainerForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: Container(
          width: 350,
          height: 360,
          padding: EdgeInsets.only(top: 150, right: 20, left: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(4, 6), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}
