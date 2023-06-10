

import 'package:flutter/material.dart';
import '../presenter/register_presenter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final presenter=UserPresenter();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();

  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  void initState(){
    super.initState();
    nameController.addListener(() {
      presenter.user.name=nameController.text;
    });
    emailController.addListener(() {
      presenter.user.email=emailController.text;
    });
    passwordController.addListener(() {
      presenter.user.password=passwordController.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Register MVP Pattern')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: presenter.validateName,
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
        
                    ),
                    labelText: 'Enter your name',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: presenter.validateEmail,
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
        
                    ),
                    labelText: 'Enter your email',
                  ),
                ),
               const  SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: presenter.validatePassword,
                  controller: passwordController,
                  obscureText: presenter.showPassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
        
                    ),
          
                    labelText: 'Enter your password',
                    suffixIcon:IconButton(
                      onPressed: (){
                        setState(() {
                          presenter.showPassword=!presenter.showPassword;
                        });
                      },
                      icon:presenter.showPassword?const Icon(Icons.visibility_off): const Icon(Icons.visibility)
                      )
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(onPressed: (){
                  if(formKey.currentState!.validate()){
                    presenter.submitForm();
                  }
                }, child: const Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}