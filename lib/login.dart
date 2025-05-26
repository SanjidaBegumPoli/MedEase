import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medease/home.dart';
import 'dart:async';
import 'package:medease/home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _EmailController =TextEditingController();
    TextEditingController _PassController =TextEditingController();
    TextEditingController _ConfirmPassController =TextEditingController();
    
    Color Secondary = const Color(0xFFECEFF1);
    Color Primary = const Color(0xFF343341);
    Color Primary_background = const Color(0xFFF1F4F8);
    Color Secondary_background = const Color(0xFFFFFFFF);
    Color alternate = const Color(0xFFE0E3E7);
    Color Secondary_text = const Color(0xFF57636C);
    Color Success = const Color(0xFF249689);
    Color book = const Color(0xFF03473F);
    Color Heart = const Color(0xFF80909);

    FirebaseAuth _auth = FirebaseAuth.instance;




    bool isLoginPage = true;

    void _showMsg (String Msg)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(Msg))
        );
    }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Back btn
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20),
              child: Container(
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: alternate,
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                ),
              ),
            ),

            // Dp
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
              ),
            ),

            // Login logout
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25),
              child: Text(
                isLoginPage ? 'Login' : 'SignUp',
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 28),
              child: Text(
                isLoginPage? 'Login to continue with  MedEase' : 'SignUp to create an account with MedEase',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          
          //Email part

            Padding(
              padding: const EdgeInsets.only(top:25,left: 30,right: 30),
              child: SizedBox(
               child:  TextFormField(
                style: TextStyle(
                  color: Primary,
                  fontFamily: 'Ubuntu',
                  fontSize: 15,

                ),
                
                keyboardType: TextInputType.emailAddress,
                controller: _EmailController,

                decoration: InputDecoration(

                  //hint
                  label: Text(
                    'Enter your Email ID',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Ubuntu',

                    ),
                    ),
                  
                  //icons
                  prefixIcon: Icon(Icons.alternate_email_rounded),
                  //suffixIcon: Icon(Icons.check),

                  fillColor: Primary_background,
                  filled: true,

                //normal border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Secondary_text,
                      width: 3,

                    )
                  ),
                  
                //focused border

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(
                      color: Primary_background,
                      width: 3,

                    )
                  ),

                //enable border

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(
                      color: Primary_background,
                      width: 3,

                    )
                  ),
                ),
              ),
              ),
              
            
          ),
            
          //Password part

            Padding(
              padding: const EdgeInsets.only(top:20,left: 30,right: 30),
              child: SizedBox(
               child:  TextFormField(
                style: TextStyle(
                  color: Primary,
                  fontFamily: 'Ubuntu',
                  fontSize: 15,

                ),
                obscuringCharacter: '.',
                obscureText: true,

                controller: _PassController,
                decoration: InputDecoration(

                  //hint
                  label: Text(
                    'Enter Password',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Ubuntu',

                    ),
                    ),
                  
                  
                  //icons
                  prefixIcon: Icon(Icons.password_rounded),
                  //suffixIcon: Icon(Icons.check),

                  fillColor: Primary_background,
                  filled: true,

                //normal border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Secondary_text,
                      width: 3,

                    )
                  ),
                  
                //focused border

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(
                      color: Primary_background,
                      width: 3,

                    )
                  ),

                //enable border

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(
                      color: Primary_background,
                      width: 3,

                    )
                  ),
                ),
              ),
              ),
              
            
          ),
            

           //Confirm Pass here
             Visibility(
              visible: !isLoginPage,
              child: Padding(
              padding: const EdgeInsets.only(top:20,left: 30,right: 30),
              child: SizedBox(
               child:  TextFormField(
                style: TextStyle(
                  color: Primary,
                  fontFamily: 'Ubuntu',
                  fontSize: 15,

                ),
                obscuringCharacter: '.',
                obscureText: true,

                controller: _ConfirmPassController,
                decoration: InputDecoration(

                  //hint
                  label: Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Ubuntu',

                    ),
                    ),
                  
                  
                  //icons
                  prefixIcon: Icon(Icons.password_rounded),
                  //suffixIcon: Icon(Icons.check),

                  fillColor: Primary_background,
                  filled: true,

                //normal border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Secondary_text,
                      width: 3,

                    )
                  ),
                  
                //focused border

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(
                      color: Primary_background,
                      width: 3,

                    )
                  ),

                //enable border

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: BorderSide(
                      color: Primary_background,
                      width: 3,

                    )
                  ),
                ),
              ),
              ),
              
            
          ), 
          ),
             
            //login btn//signin
            Padding(
              padding: const EdgeInsets.only(left: 40,right: 40,top: 30),
                child:  SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
            
                    style: ButtonStyle(
                     backgroundColor: WidgetStatePropertyAll(Colors.blue)
                    ),
                  onPressed: () async {


                    if (isLoginPage)//login hbe
                    {


                      if(_EmailController.text!='')//Email given 
                      {

                        if(_PassController.text!='')//password giben
                        {

                          try{
                            
                            UserCredential UserCred = await _auth.signInWithEmailAndPassword(
                            email: _EmailController.text, 
                            password: _PassController.text,
                            );

                            if(UserCred.user != null)
                            {
                              //success in logged in
                              _showMsg('Successfully logged in');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));

                            }

                          }on FirebaseAuthException catch(e)
                          {
                            _showMsg('$e');
                          }


                          
                            


                        }
                        else
                        {
                          _showMsg('Enter Password!');

                        }

                      }else
                      {
                        _showMsg('Enter Email ID');

                      }

                    }
                    else
                    {
                       if(_EmailController.text!='')//Email given 
                      {

                        if(_PassController.text!='')//password giben
                        {

                          if (_PassController.text ==_ConfirmPassController.text)
                          {
                            try{
                            
                            UserCredential UserCred = await _auth.createUserWithEmailAndPassword(
                              email: _EmailController.text, 
                              password: _PassController.text,
                              );

                            if(UserCred.user != null)
                            {
                              //success in signed in
                              _showMsg('Successfully signed up');



                            }

                          }on FirebaseAuthException catch(e)
                          {
                            _showMsg('$e');
                          }



                          }else
                          {
                            //pass not equal

                            _showMsg('Password isn`t matched');
                          }

                        }
                        else
                        {
                          _showMsg('Enter Password!');

                        }

                      }else
                      {
                        _showMsg('Enter Email ID');

                      }


                    }


                  }, 
                  child: Text(
                    isLoginPage ? 'Login' : 'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                
                    )
                  )
            
                )
                ),
            
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Center(
              child: Text(
                'or',
                style: TextStyle(
                  color: Secondary_text,
                  fontSize: 20,
                  fontFamily: 'Ubuntu'
                ),
              ),

            ),
            ),
            
            //google continue
            Padding(
              padding: const EdgeInsets.only(left: 45,right: 45),
              child: Container(
              
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(360),
                  border: Border.all(
                    color: alternate,
                    width: 1.5,
                    )

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 10),
                      child: Image(
                        image: AssetImage('assets/images/google.png'),
                        height: 25,
                        width: 25,
                      ),
                    ),
                  Text(
                    
                    'Continue with google',
                    style: TextStyle(
                      color: Colors.blueGrey.shade600,
                      fontSize: 18,
                      fontFamily: 'Ubuntu',
                      
                    ),
                    ),

                   

                ],
                

              ),
            ),
              ),
            
            //Sign Up 
            Padding(  
              padding: const EdgeInsets.only(top: 10,bottom: 50),
              child: Center(
                child: InkWell(
                  onTap: ()
                  {
                    isLoginPage = !isLoginPage;
                    setState(() {
                      
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                    children: [
                     TextSpan(
                        text: isLoginPage ? 'Don`t have an account? ' : 'Already have an account: ',

                        style: TextStyle(
                        color: Primary,
                        fontSize: 17,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500
                      )
                    ),

                    TextSpan(
                      text: isLoginPage ? 'Sign Up ' :'LogIn',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 17,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.w500
                      )
                   ),
                  ]
                )
              ),


                ),
                

            ),
          ),
            
            

          
          ],

        ),
      ),
      ),
      
    );
  }
}