import '../models/register_model.dart';

class UserPresenter {
  UserDetails user = UserDetails();
  bool showPassword=true;

 String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if(!RegExp('[a-zA-Z]').hasMatch(value)){
      return 'Enter valid name';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if(!RegExp(r'[a-z]+@[a-z]+.[a-z]+').hasMatch(value)){
      return 'Enter valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if(!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
     return 'Password should be 8 characters long, one uppercase, \n one lowercase, one digit and one special character';
    }
    return null;
  }

  toggle(){
    showPassword=!showPassword;
  
  }

  submitForm() {
    if (validateName(user.name) == null && validateEmail(user.email) == null &&
        validatePassword(user.password) == null) {
      print('form is valid');
    }
  }

}