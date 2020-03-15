import 'dart:async';
import 'dart:core';

import 'package:slidy_aula_2/app/shared/repositories/localstorage/local_storage_interface.dart';
/*Classe usada para TESTES não utilize-a em ambiente release ou debug.*/ 
class LocalStorageMock implements ILocalStorage{
  List<String> storage = List();
  @override
  Future delete(String key) {
      return null;
    }
  
    @override
    Future<List<String>> get(String key)async {
      return storage;
    }
  
    @override
    Future put(String key, List<String> value) {
      storage = value;
  }
  

}