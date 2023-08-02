import 'dart:developer';
import 'package:tasty_food/screens/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tasty_food/login_screens/signup_screen.dart';
import 'package:tasty_food/screens/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _obscure = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void loginUser()async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if(email == "" || password == ""){
      Dialogs.showToast("Please fll all fields");
    }else{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }else{
        Dialogs.showToast("User not found");
        }
      }on FirebaseException catch(e){
        log(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(120)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.orange.shade900,
                      Colors.orange.shade500,
                    ],
                  )),
              child: Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        border: Border.all(color: Colors.white,width: 6)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: -657,
                          child: Container(
                            width: 70,
                            height: 10,
                            decoration: const BoxDecoration (
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Transform.rotate(
                          angle: -657,
                          child: Container(
                            width: 70,
                            height: 10,
                            decoration: const BoxDecoration (
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                color: Colors.white
                            ),
                          ),
                        ),
                        const SizedBox(height: 8,),
                        Transform.rotate(
                          angle: -657,
                          child: Container(
                            width: 70,
                            height: 10,
                            decoration: const BoxDecoration (
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                color: Colors.white
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20,top: 30),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Login",style: TextStyle(color: Colors.white,fontFamily: 'login',fontSize: 40,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )
                ],
              )
              ),
            ),
            const SizedBox(height: 45,),
            Container(
              margin: const EdgeInsets.only(right: 25,left: 25),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    cursorWidth: 1,
                    cursorHeight: 17,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.orange, ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                        prefixIcon: const Icon(Icons.mail,color: Colors.grey,)
                    ),
                  ),
                  const SizedBox(height: 25,),
                  TextField(
                    controller: passwordController,
                    obscureText:_obscure? true:false,
                    cursorWidth: 1,
                    cursorHeight: 17,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.orange, ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                        prefixIcon: const Icon(Icons.key,color: Colors.grey,),
                        suffix: InkWell(
                          onTap: (){
                              setState(() {
                                _obscure = !_obscure;
                              });
                          },
                          child: Icon(
                            size: 18,
                          _obscure?FontAwesomeIcons.eyeSlash:FontAwesomeIcons.eye,
                          ),
                        )
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password ?")
                    ],
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height* 0.09,),
                  InkWell(
                    onTap: () {
                      loginUser();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,end: Alignment.centerRight,
                              colors: [
                                Colors.orange.shade500,
                                Colors.orange.shade800,
                              ]
                          ),
                          borderRadius: BorderRadius.circular(24)
                      ),
                      child: const Center(
                        child: Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height* 0.09,),

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                    },
                      child: Text("CREATE ACCOUNT",style: TextStyle(fontSize: 15,color: Colors.orange.shade800),))
                ],
              ),
            )
          ],
        ),
      ) ,
    );
  }
}
