usarHexdecimalColor(String codigoCor) {
  String cor = codigoCor.replaceAll('#', '');
  String corUsavel = '0xff' + cor;
  int corUsavelInt = int.parse(corUsavel);
  return corUsavelInt;
}
