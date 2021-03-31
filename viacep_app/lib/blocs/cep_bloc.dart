import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:viacep_app/model/cep.dart';

class CepBloc {
  final StreamController _streamController = StreamController();

  Sink<dynamic> get input => _streamController.sink;
  Stream<Cep> get output =>
      _streamController.stream.asyncMap((cep) => _searchCep(cep));

  //String url(String cep) => "https://viacep.com.br/ws/$cep/json/";

  Future<Cep> _searchCep(String cep) async {
    try {
      var url = Uri.parse('https://viacep.com.br/ws/$cep/json/');
      var response = await http.get(url);
      return (response.statusCode == 200)
          ? Cep.fromJson(jsonDecode(response.body))
          : Cep(erro: true);
    } catch (e) {
      throw Exception(e.message);
    }
  }
}
