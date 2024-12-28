import 'package:flutter/material.dart';

class Login extends StatefulWidget{
   const Login({super.key});
   @override
   State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login>{
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser=false;
  @override
Widget build(BuildContext context){
  myColor=Theme.of(context).primaryColor;
  mediaSize =MediaQuery.of(context).size;
  return Container(
     decoration: BoxDecoration(
      image: DecorationImage(
      image: const AssetImage("assets/images/mmaapp.png"),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        myColor.withOpacity(0.2),BlendMode.dstATop)
      )
     ),

    child: Scaffold(
      backgroundColor:Colors.transparent ,
      body: Stack(children: [
        Positioned(top:80,child:_buildTop()),
        Positioned(bottom:0,child:_buildBottom()),
      ]),
    ),
  ) ;
  
}


Widget _buildTop(){

  return SizedBox(
    width: mediaSize.width,
    child:const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.location_on_sharp,size: 100,color: Colors.green
    ,),
    Text("Welcome to yourr map", style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold,fontSize: 40,letterSpacing: 2),)
    ],
    ),
    );
}
Widget _buildBottom(){
    return SizedBox(
    width:mediaSize.width,
    child: Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),

        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: _buildForm(),
      ),
      ) ,
    ); 
  }
  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome ",
           style: TextStyle(
            color: myColor ,fontWeight: FontWeight.w500,fontSize: 32),
      ),
       _buildGreyText("please login with your information"),
        const SizedBox(height:60),
       _buildGreyText("Email adress"),
       _buildInputField(emailController),
        const SizedBox(height:40),
       _buildGreyText("Password"),
       _buildInputField(passwordController,isPassword: true),
        const SizedBox(height:20),
       _buildRememberForgot(),
        const SizedBox(height:20),
        _buildLoginButton(),
       
      ],
    );
  }
  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey
      ),
    );
  }
  Widget _buildInputField(TextEditingController controller,{isPassword =false}){
    return TextField(
      controller:controller ,
      decoration: InputDecoration(
        suffixIcon: isPassword? Icon(Icons.remove_red_eye):Icon(Icons.done),
      ),
      obscureText: isPassword,
    );

  }

  Widget _buildRememberForgot(){

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [Row(children: [Checkbox(value: rememberUser, onChanged: (value){
       setState(() {
        rememberUser = value!;
       });
    }
    ),
    _buildGreyText("Remember me")
    ],
    ),
    TextButton(onPressed: (){}, child:_buildGreyText("I forgot myy pasword"))
    ],
    );
  }

  Widget _buildLoginButton(){
    return ElevatedButton(onPressed: (){
      debugPrint("Email:${emailController.text}");
      debugPrint("Password:${passwordController.text}");
    },
    style: ElevatedButton.styleFrom(
      shape: const StadiumBorder(),
      elevation: 20,
      shadowColor: myColor,
      minimumSize: const Size.fromHeight(60),
    ), child: const Text("LOGIN"),
    );
  }
 
}
