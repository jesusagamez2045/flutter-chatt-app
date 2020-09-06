import 'package:chatt_app/models/mensajes_response.dart';
import 'package:chatt_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chatt_app/global/environment.dart';
import 'package:chatt_app/models/usario.dart';

class ChattService with ChangeNotifier {

  Usuario usuarioPara;

  Future<List<Mensaje>> getChatt(String usuarioID) async{

    final token = await AuthService.getToken();

    final resp = await http.get('${Environment.apiUrl}/mensajes/$usuarioID',
      headers: {
        'Content-type' : 'application/json',
        'x-token' : token
      }
    );

    if(resp.statusCode == 200){
      final mensajesResp = mensajesResponseFromJson(resp.body);
      return mensajesResp.mensajes;
    }

    return [];

  }

}

