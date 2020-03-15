import 'package:flutter/material.dart';
import 'package:slidy_aula_2/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() => runApp(ModularApp(module: AppModule()));

//USAR SLIDY:
//slidy start
//Selecionar flutter_modular e mobx
// slidy install <nomedalib> (Selecionar plugins que vão ser necessários)
// slidy generate page pages/splash (Gera uma SplashPage) 
// slidy generate module modules/login -c (Gera um modulo login com controller
// slidy run <script> (Roda um script definido no pubspec.yaml)
// slidy generate widget modules/home/components/item -b (Cria apenas um widget)