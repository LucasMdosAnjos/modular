
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_aula_2/app/shared/auth/auth_controller.dart';
import 'package:slidy_aula_2/app/shared/repositories/localstorage/local_storage_interface.dart';

part 'home_controller.g.dart';

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  final ILocalStorage _storage = Modular.get(); 
  /*Principio do desacoplamento prega que deve ser iniciado
  /a variável por meio de sua interface. */

  final textController = TextEditingController();

  @observable
  ObservableList<String> list = <String>[].asObservable();

   @observable
  bool disableAdd = true;

  _HomeBase(){
    init();
    textController.addListener(() {
      disableAdd = textController.text == null ||
          textController.text.isEmpty ||
          textController.text.length < 3;
    });
  }

  @action
  init() async{
    List<String> listLocal = await _storage.get('list');
    if(listLocal == null){ 
      list =  <String>[].asObservable(); 
    }else{
      list = listLocal.asObservable(); 
      /*Com observableList o flutter irá notificar o Mobx que a variável mudou.
      A plain List<T> does not have observability built in. If you change the items, 
      MobX cannot know that the list items changed. However an ObservableList<T> is aware 
      of such changes, like adding, removal, modification of an item at an index, etc.
      */
    }

  }

  @action
  void save() {
    list.add(textController.text);
    _storage.put('list', list);
    textController.clear();
  }

  @action
  void remove(int index){
    list.removeAt(index);
    _storage.put('list', list);
  }

  logoff() async{
   await Modular.get<AuthController>().logOut();
   Modular.to.pushReplacementNamed('/');
  }

}