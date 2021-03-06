import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:chatt_app/helpers/mostrar_alerta.dart';
import 'package:chatt_app/services/socket_service.dart';
import 'package:chatt_app/widgets/boton_azul.dart';
import 'package:chatt_app/widgets/labels.dart';
import 'package:chatt_app/widgets/custom_input.dart';
import 'package:chatt_app/widgets/logo.dart';
import 'package:chatt_app/services/auth_service.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * .95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'Registro',),
                _Form(),
                Labels(
                  ruta: 'login',
                  titulo: '¿Ya tienes cuenta?',
                  subtitulo: 'Ingresa ahora',
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Términos y condiciones de uso',
                    style: TextStyle(
                      fontWeight: FontWeight.w200
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            textController: nameController,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passwordController,
            isPassword: true,
          ),
          BotonAzul(
            text: 'Registrar',
            onpressed: authService.autenticando 
            ? null 
            : () async {
              FocusScope.of(context).unfocus();
              final isRegisterOk = await authService.register(
                nameController.text.trim(), 
                passwordController.text.trim(), 
                emailController.text.trim()
              );
              if(isRegisterOk == true){
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              }else{
                mostrarAlerta(context, 'Registro incorrecto', isRegisterOk);
              }
            },
          ),
        ],
      ),
    );
  }
}
