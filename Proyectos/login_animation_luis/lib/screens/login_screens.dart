
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  
  StateMachineController? controller;

  SMIBool? isChecking;
  SMIBool? isHandsUp;
  SMITrigger? trigSuccess;
  SMITrigger?trigFail;
  SMINumber? numLook;
  
  
  
  
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
          height: 400,
          child: RiveAnimation.asset(
            'animated_login_character.riv',
            stateMachines: ["Login Machine"],
            onInit: (artboard){
              controller = StateMachineController.fromArtboard(artboard,"Login Machine");
                // verifica si hay Controlador
                if (controller==null) return;
                //agrega Controlador
                artboard.addController(controller!);

                // enlaza la animacion con la app
                isChecking = controller!.findSMI("isChecking");
                isHandsUp = controller!.findSMI("isHandsUp");
                trigSuccess = controller!.findSMI("trigSuccess");
                trigFail = controller!.findSMI("trigFail");
                numLook = controller!.findSMI("numLook");
            },
            
            )),
          
          SizedBox(height: 10),
          
           TextField(
            onChanged: (value) {

                if(numLook!=null)
             {
             numLook!.change(value.length.toDouble());
             }

              if(isHandsUp!= null)
              {
              //no subir las manos al escribir
                isHandsUp!.change(false);
                }

             

              //verifica que SMI no sea Nulo
              if(isChecking==null) return;
              isChecking!.change(true);
              
            },

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

             onChanged: (value) {
              if(isChecking!= null)
              {
              //no subir las manos al escribir
                isChecking!.change(false);
               
              }

              
              //verifica que SMI no sea Nulo
              if(isHandsUp==null) return;
              isHandsUp!.change(true);
             
            },
            
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

         ),
        
        //Boton de login
        SizedBox(height: 10),
        MaterialButton(
          minWidth: size.width,
          height: 50,
          color: Colors.blue,
          //forma del boton
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12)
          ),
          onPressed: (){},
          child: const Text("Login",
          style: TextStyle(color: Colors.white),
          ),
           ),

           SizedBox(height: 10),

           SizedBox(

            width: size.width,
            child: Row(
            children: [

              const Text("Don´t you have account"),
              TextButton(
              onPressed:(){},
              child:const Text(
              "Sign up",
              style: TextStyle(
                color: Colors.black,
                //propiedades negritas y underline
                fontWeight: FontWeight.bold,
                decoration:TextDecoration.underline
              ),
              )
              )
            ],
              
            ),
            
           )

           

      ],
    ),
  )),


    );
  }
}


