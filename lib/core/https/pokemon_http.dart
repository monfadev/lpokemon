import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pokemon/core/resources/environtment.dart';

import '../models/pokemon.dart';

class PokemonHttp {
  static Future<List<Pokemon>> listOfPokemon() async {
    try {
      var response = await Dio().get(endpoint);
      if (response.statusCode == 200) {
        return response.data["results"].map<Pokemon>((item) => Pokemon.fromJson(item)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  static Future<List<Pokemon>> listOfPokemon2(int offset) async {
    try {
      var response = await Dio().get("$endpoint?offset=$offset&limit=20");
      log(offset.toString());
      if (response.statusCode == 200) {
        return response.data["results"].map<Pokemon>((item) => Pokemon.fromJson(item)).toList();
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
