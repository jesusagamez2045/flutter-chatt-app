import 'package:chatt_app/widgets/boton_azul.dart';
import 'package:flutter/material.dart';
import 'package:chatt_app/widgets/labels.dart';
import 'package:chatt_app/widgets/custom_input.dart';
import 'package:chatt_app/widgets/logo.dart';


class LoginPage extends StatelessWidget {

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
                Logo(titulo: 'Messenger',),
                _Form(),
                Labels(
                  ruta: 'register', 
                  titulo: '¿No tienes cuenta?', 
                  subtitulo: 'Crea una ahora!',
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
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
            text: 'Ingrese',
            onpressed: (){},
          ),
        ],
      ),
    );
  }
}
