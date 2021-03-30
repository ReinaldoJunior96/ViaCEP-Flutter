import 'dart:async';

import 'package:dio/dio.dart';
import 'package:viacep_app/model/cep.dart';

class CepBloc {
  final StreamController _streamController = StreamController();

  Sink<dynamic> get input => _streamController.sink;
  Stream<Cep> get output => _streamController.stream
      .where((cep) => cep.length > 7)
      .asyncMap((cep) => _searchCep(cep));

  String url(String cep) => "https://viacep.com.br/ws/$cep/json/";

  Future<Cep> _searchCep(String cep) async {
    Response response = await Dio().get(url(cep));
    return Cep.fromJson(response.data);
  }
}
