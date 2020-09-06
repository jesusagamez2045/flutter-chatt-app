import 'package:http/http.dart' as http;
import 'package:chatt_app/models/usuarios_response.dart';
import 'package:chatt_app/services/auth_service.dart';
import 'package:chatt_app/global/environment.dart';
import 'package:chatt_app/models/usario.dart';

class UsuariosService {
  
  Future<List<Usuario>> getUsuarios() async {
    try {
      final token = await AuthService.getToken();
      final resp = await http.get('${Environment.apiUrl}/usuarios', 
        headers: {
          'Content-type' : 'application/json',
          'x-token' : token
        }
      ); 

      if(resp.statusCode == 200){
        final usuariosResponse = usuariosResponseFromJson(resp.body);
        return usuariosResponse.usuarios;
      }

      return [];

    } catch (e) {
      return [];
    }
  }
}