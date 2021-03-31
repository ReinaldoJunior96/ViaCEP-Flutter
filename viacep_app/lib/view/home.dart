import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viacep_app/blocs/cep_bloc.dart';
import 'package:viacep_app/componentes/container_form.dart';
import 'package:viacep_app/componentes/hexadecimal_color.dart';
import 'package:viacep_app/model/cep.dart';

class HomePage extends StatelessWidget {
  final _cepController = TextEditingController();
  CepBloc bloc = CepBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(usarHexdecimalColor('#ffdde1')),
      body: Container(
        child: SingleChildScrollView(
          child: Stack(children: [
            ContainerForm(),
            Padding(
              padding: const EdgeInsets.only(top: 300, right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.my_location_outlined,
                    color: Color(usarHexdecimalColor('#00467F')),
                  ),
                  hintText: "C E P",
                  hintStyle: TextStyle(
                    color: Color(
                      usarHexdecimalColor('#536976'),
                    ),
                  ),
                  filled: true,
                  fillColor: Color(usarHexdecimalColor('#ffdde1')),
                ),
                controller: _cepController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                onChanged: (value) {
                  bloc.input.add(value);
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 390),
                child: StreamBuilder<Cep>(
                  stream: bloc.output,
                  initialData: Cep(
                    bairro: " ",
                    erro: false,
                  ),
                  builder: (context, snapshot) {
                    Cep model = snapshot.data;
                    if (model.erro == true && _cepController.text.isEmpty) {
                      return Text("");
                    }
                    if (model.erro == true) {
                      return CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Color(usarHexdecimalColor('#654ea3'))),
                      );
                    }
                    if (model.cep == null && !_cepController.text.isEmpty) {
                      return Text("CEP Invalido");
                    }
                    return Padding(
                      padding: const EdgeInsets.only(right: 50, left: 50),
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "${(model.logradouro == null) ? " " : "${model.logradouro}, ${model.bairro}"}",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Color(
                                    usarHexdecimalColor('#536976'),
                                  ),
                                ),
                              ),
                            ),
                            subtitle: Text(
                              "${(model.localidade == null) ? " " : "${model.localidade} - ${model.uf}"}",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  color: Color(
                                    usarHexdecimalColor('#00467F'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Image.asset(
                      "images/location.png",
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
