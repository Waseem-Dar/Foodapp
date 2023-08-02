import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasty_food/screens/helper.dart';
import 'package:tasty_food/screens/home_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void createUser()async {
    String name =  nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if(email == "" && password == "" && name == ""){
     Dialogs.showToast("Please fill all fields");
    }else{
      try{
     UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
     if(userCredential.user != null){
       Navigator.popUntil(context, (route)=> route.isFirst,);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
     }
    }on FirebaseException catch (e){
        log(e.toString());
      }
      }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:Column(
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
                    alignment: Alignment.centerRight,
                    child: const Text("Register",style: TextStyle(color: Colors.white,fontFamily: 'login',fontSize: 40,fontWeight: FontWeight.bold),),
                  )
                ],
              )
              ),
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            Container(
              margin: const EdgeInsets.only(right: 25,left: 25),
              child: Column(
                children: [
                  const SizedBox(height: 10,),
                  TextField(
                    controller: nameController,
                    cursorWidth: 1,
                    cursorHeight: 17,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintText: ' Name',
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(color: Colors.orange, ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                        prefixIcon: const Icon(Icons.person,color: Colors.grey,)
                    ),
                  ),
                  const SizedBox(height: 10,),
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
                  const SizedBox(height: 10,),
                  TextField(
                    controller: passwordController,
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
                        prefixIcon: const Icon(Icons.key,color: Colors.grey,)
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                      alignment: Alignment.centerRight,
                      child: const Text("Forgot Password ?")),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.05 ,),
                  InkWell(
                    onTap: () {
                      createUser();
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
                        child: Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account ?",style: TextStyle(fontSize: 15),),
                      Text("Register",style: TextStyle(fontSize: 15,color: Colors.orange.shade800),)
                    ],
                  )
                ],
              ),
            )
          ],
        ) ,
      ),
    );
  }
}
