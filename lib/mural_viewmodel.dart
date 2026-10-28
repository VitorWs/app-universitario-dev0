import 'package:flutter/foundation.dart';

class MuralViewModel extends ChangeNotifier {
  List<String> avisos = ['Bem-vindo ao Mural da InoveJr!'];
  bool isLoading = false;

  void adicionarAviso(String texto) {
    isLoading = true;
    notifyListeners();

    avisos.add(texto);
    isLoading = false;
    notifyListeners();
  }
}