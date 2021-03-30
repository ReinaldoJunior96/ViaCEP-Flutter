import 'package:flutter/material.dart';
import 'package:viacep_app/blocs/cep_bloc.dart';
import 'package:viacep_app/model/cep.dart';

class HomePage extends StatelessWidget {
  final _cepController = TextEditingController();

  CepBloc bloc = CepBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  bloc.input.add(value);
                },
              ),
              StreamBuilder<Cep>(
                  stream: bloc.output,
                  initialData: Cep(bairro: "Sem bairro"),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Erro na pesquisa");
                    }
                    Cep model = snapshot.data;
                    return Text('${model.bairro}');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
