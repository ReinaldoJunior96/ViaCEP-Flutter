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
                maxLength: 8,
                onChanged: (value) {
                  bloc.input.add(value);
                },
              ),
              StreamBuilder<Cep>(
                  stream: bloc.output,
                  initialData: Cep(bairro: "Informe um CEP", erro: false),
                  builder: (context, snapshot) {
                    Cep model = snapshot.data;
                    if (model.erro == true && _cepController.text.isEmpty) {
                      return Text("Infomre um cep");
                    }
                    if (model.erro == true) {
                      return CircularProgressIndicator();
                    }
                    if (model.cep == null && !_cepController.text.isEmpty) {
                      return Text("CEP Invalido");
                    }
                    return Text('${model.bairro}');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
