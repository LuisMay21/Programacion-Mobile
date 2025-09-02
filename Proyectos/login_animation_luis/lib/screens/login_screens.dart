import 'package:flutter/material.dart';
import 'package:rive/math.dart';
import 'package:rive/rive.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override

  bool  _passwordVisible = false;

  Widget build(BuildContext context) {

      //para obtener el tamaño de pantalla del dispositivo
      final Size size =MediaQuery.of(context).size;
     
    return Scaffold(
body: SafeArea(
  
  child: Padding( //margen de la pantalla
    padding: const EdgeInsets.symmetric(horizontal: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        SizedBox(
          //ancho de la pantalla calculado por MQ
          width: size.width,
          height: 200,
          child: RiveAnimation.asset('animated_login_character.riv')),
          
          SizedBox(height: 10),
          
           TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email",
              prefixIcon: const Icon(Icons.mail),
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
          ),
    
           SizedBox(height: 10),
    
          
          
          TextField(
            //para que se oculte
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              hintText: "Contraseña",
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
              icon: Icon(
              _passwordVisible
              ? Icons.visibility
              :Icons.visibility_off),
              onPressed: (){
                setState(() {
                  _passwordVisible=!_passwordVisible;
                });
              },

              ),


              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12)
              )
            ),
          ),
         
         const SizedBox(height: 10,),

         SizedBox(
         width: size.width,
         child: const Text(
          "¿Olvidaste tu Contraseña?",
          textAlign: TextAlign.left,
          style: TextStyle(
            decoration: TextDecoration.underline
          ),


         ),

         )


      ],
    ),
  )),


    );
  }
}